//
//  ContentType.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 26.02.24.
//

import Foundation

enum ContentType {
    case json
    case formURLEncoded
    case multipartFormData
    case xml
    case plainText
    case custom(String)
    
    var headerValue: String {
        switch self {
        case .json:
            //return "application/json"
            return "application/json-patch+json"
        case .formURLEncoded:
            return "application/x-www-form-urlencoded"
        case .multipartFormData:
            return "multipart/form-data"
        case .xml:
            return "application/xml"
        case .plainText:
            return "text/plain"
        case .custom(let value):
            return value
        }
    }
}
