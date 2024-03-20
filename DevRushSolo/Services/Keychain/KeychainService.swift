//
//  KeychainService.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 27.02.24.
//

import Foundation
import KeychainSwift

enum TokenType: String {
    case accessToken
    case refreshToken
}

class KeychainService: ObservableObject {
    
    let keychain = KeychainSwift()
    
    /// Сохраняем любой токен
    func saveUserToken(tokenType: TokenType, token: String) {
        keychain.set(token, forKey: tokenType.rawValue)
    }
    
    /// Читаем любой токен
    func readUserToken(tokenType: TokenType) -> String? {
        return keychain.get(tokenType.rawValue)
    }
    
    /// Удаляем оба токена из кейчейна
    func resetTokens() {
        keychain.set("", forKey: TokenType.accessToken.rawValue)
        keychain.set("", forKey: TokenType.refreshToken.rawValue)
    }
}




