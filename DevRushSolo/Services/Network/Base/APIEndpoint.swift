//
//  APIEndpoint.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 26.02.24.
//

import Foundation

protocol APIEndpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var body: [String: Any]? { get }
    var contentType: ContentType? { get }
    var acceptType: ContentType? { get }
}
