//
//  APIError.swift
//
//
//  Created by Илья Шаповалов on 18.02.2024.
//

import Foundation

/*
 {
   "code": 1001,
   "message": "Неправильный логин или пароль",
   "target": {
     "id": "6lE4OIlA_EyE7z4r4DG7ZQ",
     "lastConfirmCodeAttemptsDate": null,
     "attemptsCount": 1
   },
   "systemException": null,
   "innerException": null,
   "stackTrace": null
 }
 */

public struct APIError: Decodable {
    let code: Int
    let message: String
    let target: String
    let systemException: String?
    let innerException: String?
    let stackTrace: String?
}
