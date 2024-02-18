//
//  Endpoint.swift
//
//
//  Created by Илья Шаповалов on 18.02.2024.
//

import Foundation

public struct Endpoint {
    //MARK: - Private properties
    private let path: String
    private let method: HTTPMethod
    private let headers: [String: String]
    private let queryItems: [URLQueryItem]
    
    //MARK: - URL
    private var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.accelonline.io"
        components.path = "/api/v1/".appending(path)
        
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            preconditionFailure("Unable to create url from: \(components)")
        }
        return url
    }
    
    //MARK: - Request
    public var request: URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        return request
    }
    
    //MARK: - init(_:)
    public init(
        path: String,
        method: HTTPMethod = .GET,
        headers: [String : String] = .init(),
        queryItems: [URLQueryItem] = .init()
    ) {
        self.path = path
        self.method = method
        self.headers = headers
        self.queryItems = queryItems
    }
}

//MARK: - Constructors
public extension Endpoint {
    func httpMethod(_ method: HTTPMethod) -> Self {
        Endpoint(path: self.path, method: method, headers: self.headers, queryItems: self.queryItems)
    }
    
    func headers(_ headers: (String, String)...) -> Self {
        Endpoint(
            path: self.path,
            method: self.method,
            headers: self.headers.merging(headers, uniquingKeysWith: { $1 }),
            queryItems: self.queryItems
        )
    }
    
    func queryItems(_ items: [URLQueryItem]) -> Self {
        Endpoint(path: self.path, method: self.method, headers: self.headers, queryItems: items)
    }
}

//MARK: - HTTPMethod
public extension Endpoint {
    enum HTTPMethod: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
}
