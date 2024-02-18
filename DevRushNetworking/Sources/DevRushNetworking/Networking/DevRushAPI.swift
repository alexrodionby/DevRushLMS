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

    func login(body: LoginRequest) {
        
    }
    
}

private extension DevRushAPI {
    private func requestPublisher(_ endpoint: Endpoint, body: Encodable) -> AnyPublisher<APIResponse, Error> {
        Just(endpoint)
            .map(\.request)
            .tryMap(apply(body: body))
            .map(SessionWorker.init)
            .flatMap({ $0.requestPublisher() })
            .eraseToAnyPublisher()
    }
    
    private func apply(body: Encodable) -> (URLRequest) throws -> URLRequest {
        {
            var request = $0
            request.httpBody = try JSONEncoder().encode(body)
            return request
        }
    }
}
