//
//  HTTPClient.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 26.02.24.
//

import Foundation
import Combine

class HTTPClient {
    
    // MARK: - Session configuration
    
    let configuration = URLSessionConfiguration.default
    let session: URLSession
    
    init() {
        session = URLSession(configuration: configuration)
    }
    
    // MARK: - Request
    
    func request<T: Codable>(endpoint: APIEndpoint) -> AnyPublisher<T, APIError> {
        
        // Попытка создания запроса на основе Endpoint
        guard let urlRequest = buildURLRequest(endpoint: endpoint) else {
            return Fail(error: APIError.unknown(statusCode: -1, message: "Failed to build URL request"))
                .eraseToAnyPublisher()
        }
        
        // Выполнение запроса и обработка результатов
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.unknown(statusCode: -1, message: "No HTTPURLResponse")
                }
                
                guard 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.from(response: httpResponse, data: data) ?? APIError.unknown(statusCode: httpResponse.statusCode, message: "Request failed with status code \(httpResponse.statusCode)")
                }
                print("--- URL Status Code ===", httpResponse.statusCode)
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let apiError = error as? APIError {
                    print("--- URL Status Code ===", apiError.localizedDescription)
                    return apiError
                } else {
                    return APIError.unknown(statusCode: -1, message: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: - Helper methods
    
    private func buildURLRequest(endpoint: APIEndpoint) -> URLRequest? {
        
        var components = URLComponents()
        
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        
        // Добавление параметров запроса только в случае, если они есть
        if let queryItems = createQueryParameters(endpoint: endpoint), !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            print("Ошибка: Невозможно создать URL из компонентов: \(components)")
            return nil
        }
        
        print("URL для запроса ===", url)
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        // request.addValue(Constants.token, forHTTPHeaderField: "Bearer")
        
        if let headers = endpoint.headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
                print("H-key ===", key)
                print("H-value ===", value)
            }
        }
        
        if let contentType = endpoint.contentType {
            request.addValue(contentType.headerValue, forHTTPHeaderField: "Content-Type")
        }
        
        if let acceptType = endpoint.acceptType {
            request.addValue(acceptType.headerValue, forHTTPHeaderField: "Accept")
        }
        
        if let body = endpoint.body {
            switch endpoint.contentType {
            case .json:
                request.httpBody = try? JSONSerialization.data(withJSONObject: body)
            case .formURLEncoded:
                let bodyString = body.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
                request.httpBody = bodyString.data(using: .utf8)
            case .multipartFormData:
                // Обработка multipart/form-data требует более сложной логики,
                // так как вам, возможно, потребуется отправлять файлы или изображения.
                break
            default:
                break
            }
        }
        
        return request
    }
    
    
    private func createQueryParameters(endpoint: APIEndpoint) -> [URLQueryItem]? {
        
        var queryItems = [URLQueryItem].init()
        
        guard let parameters = endpoint.parameters else {
            return nil
        }
        
        for (key, value) in parameters {
            switch value {
            case let stringValue as String where !stringValue.isEmpty:
                queryItems.append(URLQueryItem(name: key, value: stringValue))
                
            case let intValue as Int:
                queryItems.append(URLQueryItem(name: key, value: String(intValue)))
                
            case let stringArrayValue as [String]:
                for item in stringArrayValue {
                    queryItems.append(URLQueryItem(name: key, value: item))
                }
                
            case let boolValue as Bool:
                queryItems.append(URLQueryItem(name: key, value: String(boolValue)))
                
            default:
                continue
            }
        }
        
        return queryItems.isEmpty ? nil : queryItems
    }

}
