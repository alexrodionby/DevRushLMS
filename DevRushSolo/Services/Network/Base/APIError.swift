//
//  APIError.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 26.02.24.
//

import Foundation

enum APIError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case internalServerError
    case unknown(statusCode: Int, message: String)
    
    init(statusCode: Int, message: String, error: String) {
        switch statusCode {
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        case 500:
            self = .internalServerError
        default:
            self = .unknown(statusCode: statusCode, message: message)
        }
    }
    
    static func from(response: HTTPURLResponse?, data: Data?) -> APIError? {
        guard let statusCode = response?.statusCode else {
            return .unknown(statusCode: -1, message: "No status code")
        }
        
        guard let data = data else {
            return .unknown(statusCode: statusCode, message: "No error data")
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            let message = json?["message"] as? String ?? "No error message"
            let error = json?["error"] as? String ?? "Unknown Error"
            
            return APIError(statusCode: statusCode, message: message, error: error)
        } catch {
            return .unknown(statusCode: statusCode, message: "Failed to parse error data")
        }
    }
}

