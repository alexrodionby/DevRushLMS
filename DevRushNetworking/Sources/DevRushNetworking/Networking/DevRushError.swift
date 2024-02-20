//
//  DevRushError.swift
//  
//
//  Created by Илья Шаповалов on 20.02.2024.
//

import Foundation

public enum DevRushError: Error {
    case encodeFail(_ info: String)
    case decodeFail(_ info: String)
    case apiErrors([String])
    case responseBodyMissing
    case badResponse
    case unknown(Error)
    
    static func map(_ error: Error) -> Self {
        switch error {
        case let encoding as EncodingError:
            return .encodeFail(String(describing: encoding))
            
        case let decoding as DecodingError:
            return .decodeFail(String(describing: decoding))
            
        default: return .unknown(error)
        }
    }
}
