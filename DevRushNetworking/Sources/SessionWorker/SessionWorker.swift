//
//  NetworkWorker.swift
//
//
//  Created by Илья Шаповалов on 18.02.2024.
//

import Foundation
import Combine

public struct SessionWorker {
    public typealias Response = (data: Data, response: URLResponse)
    
    //MARK: - Private properties
    private let request: URLRequest
    private var session: URLSession { URLSession(configuration: config) }
    
    @usableFromInline let config = URLSessionConfiguration.default
    
    //MARK: - init(_:)
    public init(_ request: URLRequest) {
        self.request = request
    }
    
    //MARK: - Public methods
    public func requestPublisher() -> AnyPublisher<Response, Error> {
        session
            .dataTaskPublisher(for: request)
            .mapError({ $0 })
            .eraseToAnyPublisher()
    }
}

extension SessionWorker {
    @inlinable
    func timeoutForRequest(_ timeout: TimeInterval) -> Self {
        self.config.timeoutIntervalForRequest = timeout
        return self
    }
    
    @inlinable
    func timeoutForResource(_ timeout: TimeInterval) -> Self {
        self.config.timeoutIntervalForResource = timeout
        return self
    }
    
    @inlinable
    func cache(_ urlCache: URLCache) -> Self {
        self.config.urlCache = urlCache
        return self
    }
    
    @inlinable
    func cachePolicy(_ policy: NSURLRequest.CachePolicy) -> Self {
        self.config.requestCachePolicy = policy
        return self
    }
}
