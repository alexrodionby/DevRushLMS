//
//  EndpointsTests.swift
//  
//
//  Created by Илья Шаповалов on 18.02.2024.
//

import XCTest
import Endpoint
@testable import DevRushNetworking

final class EndpointsTests: XCTestCase {
        
    func test_login() {
        let sut = Endpoint.login()
        
        XCTAssertEqual(sut.request.url?.absoluteString, "https://api.accelonline.io/api/v1/authorization/login")
        XCTAssertEqual(sut.request.httpMethod, "POST")
        XCTAssertEqual(
            sut.request.allHTTPHeaderFields,
            [
                "Accept": "application/json",
                "Content-Type": "application/json-patch+json"
            ]
        )
    }
    
    
}
