//
//  JWTService.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 8.03.24.
//

import Foundation
import Combine

class JWTService: ObservableObject {
    
    private var network: HTTPClient = .init()
    private var keychain: KeychainService = .init()
    private var cancellables: Set<AnyCancellable> = .init()
    
    /// Проверяем, не протух ли токен, и возвращаем ответ в bool
    func isTokenExpired() -> Bool {
        let tokenComponents = Constants.accessToken.components(separatedBy: ".")
        
        guard tokenComponents.count >= 2 else {
            print("--- Ошибка, неверный формат токена ---")
            return true
        }
        
        guard let payloadData = Data(base64URLEncoded: tokenComponents[1]) else {
            print("--- Ошибка, неверный формат payloadData ---")
            return true
        }
        
        guard let payload = try? JSONSerialization.jsonObject(with: payloadData, options: []) as? [String: Any] else {
            print("--- Ошибка, неверный формат payload ---")
            return true
        }
        
        guard let exp = payload["exp"] as? TimeInterval else {
            print("--- Ошибка, неверный формат exp ---")
            return true
        }
        
        let currentTime = Date().timeIntervalSince1970
        print("--- Текущее время =", currentTime)
        print("--- Время протухания =", exp)
        return currentTime >= exp
    }
    
    /// Обновляем accessToken  и записываем оба токена заново
    func refreshUserToken(completion: (() -> Void)? = nil) {
        network.request(endpoint: AuthorizationEndpoint.refreshAccessToken)
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    print("--- Запрос refreshAccessToken завершился успешно ---")
                case let .failure(error):
                    print("--- Запрос refreshAccessToken завершился неудачно ---")
                    print("--- Ошибка ===", error.localizedDescription, " ---")
                }
            } receiveValue: { [weak self] (result: UserLoginResponseModel) in
                print("--- Данные получены по запросу refreshAccessToken ---")
                if result.success == true {
                    print("result.success =", result.success!)
                    self?.saveUsersTokens(userResponse: result)
                    completion?()
                } else {
                    print("error in result =", result.errors?[0].message ?? "no message")
                }
            }
            .store(in: &cancellables)
    }
    
    /// Сохраняем оба токена в keychain
    func saveUsersTokens(userResponse: UserLoginResponseModel) {
        if userResponse.success ?? false {
            keychain.saveUserToken(tokenType: .accessToken, token: userResponse.body?.accessToken ?? "")
            keychain.saveUserToken(tokenType: .refreshToken, token: userResponse.body?.refreshToken ?? "")
            print("--- Записали оба токена в кейчейн ---")
        } else {
            print("--- Ошибка сохранения токенов в кейчейн ---")
        }
    }
    
    /// Проверяем, есть ли сохраненные токены в keychain
    func areTokensStored() -> Bool {
        if let _ = keychain.readUserToken(tokenType: .accessToken), let _ = keychain.readUserToken(tokenType: .refreshToken) {
            print("--- Оба токена есть в keychain ---")
            return true
        } else {
            print("--- Оба либо один токен отсутствует в keychain ---")
            return false
        }
    }
    
    /// Проверяем, залогинен ли пользователь и все ли в порядке с токенами
    func checkTokensAndRefreshIfNeeded(completion: @escaping (Bool) -> Void) {
        guard areTokensStored() else {
            completion(false)
            return
        }
        
        guard let accessToken = keychain.readUserToken(tokenType: .accessToken) else {
            completion(false)
            return
        }
        
        guard let refreshToken = keychain.readUserToken(tokenType: .refreshToken) else {
            completion(false)
            return
        }
        
        if isTokenExpired() {
            print("--- Токен просрочен ---")
            refreshUserToken() {
                completion(true)
                print("--- Обновили токен ---")
            }
        } else {
            completion(true)
            print("--- Токен не просрочен ---")
        }
    }
    
    
    
}
