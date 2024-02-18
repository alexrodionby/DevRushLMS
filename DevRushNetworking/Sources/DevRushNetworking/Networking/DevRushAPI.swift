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
    
    //MARK: - init(_:)
    public init(token: String) {
        self.token = token
    }

    public func login(body: LoginRequest) {
        
    }
    
}

private extension DevRushAPI {
    func requestPublisher(_ endpoint: Endpoint, body: Encodable? = nil) -> AnyPublisher<APIResponse, Error> {
        Just(endpoint)
            .map(\.request)
            .tryMap(addBody(body))
            .map(addToken(token))
            .map(SessionWorker.init)
            .flatMap({ $0.requestPublisher() })
            .eraseToAnyPublisher()
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
