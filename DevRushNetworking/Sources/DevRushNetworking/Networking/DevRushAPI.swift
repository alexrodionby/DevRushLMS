//
//  DevRushAPI.swift
//
//
//  Created by Илья Шаповалов on 18.02.2024.
//

import Foundation
import Combine
import Endpoint
import SessionWorker

public struct DevRushAPI {
    public typealias APIResponse = (data: Data, response: URLResponse)
    
    private let token: String
    private let cache: URLCache
    
    //MARK: - init(_:)
    public init(
        token: String,
        cache: URLCache = .shared
    ) {
        self.token = token
        self.cache = cache
    }

    //MARK: - Public methods
    public func login(body: LoginRequest) -> AnyPublisher<TokenResponse, DevRushError> {
        requestPublisher(.login(), body: body)
            .tryMap(checkHTTP(response:))
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .tryMap(unwrapBody(_:))
            .mapError(DevRushError.map(_:))
            .eraseToAnyPublisher()
    }
    
}

private extension DevRushAPI {
    func unwrapBody(_ response: LoginResponse) throws -> TokenResponse {
        guard response.success else {
            throw DevRushError.apiErrors(response.errors.map(\.message))
        }
        guard let body = response.body else {
            throw DevRushError.responseBodyMissing
        }
        return body
    }
    
    func checkHTTP(response: APIResponse) throws -> Data {
        guard
            let httpResponse = response.response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            throw DevRushError.badResponse
        }
        return response.data
    }
    
    func requestPublisher(_ endpoint: Endpoint, body: Encodable? = nil) -> AnyPublisher<APIResponse, Error> {
        Just(endpoint)
            .map(\.request)
            .tryMap(addBody(body))
            .map(addToken(token))
            .flatMap(configSession(cache))
            .eraseToAnyPublisher()
    }
    
    func configSession(_ cache: URLCache) -> (URLRequest) -> AnyPublisher<APIResponse, Error> {
        { request in
            SessionWorker(request)
                .cache(cache)
                .requestPublisher()
        }
    }
    
    func addBody(_ body: Encodable?) -> (URLRequest) throws -> URLRequest {
        {
            var request = $0
            request.httpBody = try body.map { try JSONEncoder().encode($0) }
            return request
        }
    }
    
    func addToken(_ token: String) -> (URLRequest) -> URLRequest {
        {
            var request = $0
            request.addValue(token, forHTTPHeaderField: "Authorization")
            return request
        }
    }
}
