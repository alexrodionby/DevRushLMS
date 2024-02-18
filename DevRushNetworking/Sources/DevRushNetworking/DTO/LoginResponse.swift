//
//  LoginResponse.swift
//
//
//  Created by Илья Шаповалов on 18.02.2024.
//

import Foundation

/*
 {
   "success": false,
   "errors": [
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
   ],
   "body": null,
   "resetToken": false
 }
 
 {
   "success": true,
   "errors": [],
   "body": {
     "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzZDkxMGFiZi0xYzgwLTRjZTEtOTgzYi04NGY4YjUxM2JhZGIiLCJqdGkiOiJiODEwYjBmYS1kZDZmLTQ1YTYtYmMyMS1mODY0MzgzNGI3ZGYiLCJpYXQiOiIxNTY5MjUyNjA3LjI5MTg5IiwiY29uY3VycmVuY3lTdGFtcCI6IjE0MWxwWnFUSzB5WmNWVlJ6cE9yNmciLCJ1c2VyIjoie1wiaWRcIjpcIjNkOTEwYWJmLTFjODAtNGNlMS05ODNiLTg0ZjhiNTEzYmFkYlwiLFwiZW1haWxcIjpcInlha2F0b21vc2hpQGdtYWlsLmNvbVwiLFwiZmlyc3ROYW1lXCI6bnVsbCxcImxhc3ROYW1lXCI6bnVsbCxcInJvbGVzXCI6W1widXNlclwiXX0iLCJyb2xlIjoiVXNlciIsIm5iZiI6MTU2OTI1MTcwNywiZXhwIjoxNTY5MjUyNjA3LCJpc3MiOiJBY2NlbCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTAwMCJ9.GLioCOFALMDVR1y1paI0kjx8X4NNzrusbC-8pEJwUuU",
     "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzZDkxMGFiZi0xYzgwLTRjZTEtOTgzYi04NGY4YjUxM2JhZGIiLCJqdGkiOiIxYWQ2ZTczMC02ZmQ4LTRhNWYtODQzMS05MzM3M2VhMGMxNTAiLCJpc3MiOiJBY2NlbCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTAwMCJ9.E7cVbubs7hzbodzxqmzy2o2bgsDlgD9UKIGxQiQN7dU"
   },
   "resetToken": false
 }
 
 */

public struct LoginCredential: Decodable {
    let accessToken: String
    let refreshToken: String
}

public struct LoginResponse: Decodable {
    public let success: Bool
    public let errors: [APIError]
    public let body: LoginCredential?
    public let resetToken: Bool
}
