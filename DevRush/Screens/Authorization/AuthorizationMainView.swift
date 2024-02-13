//
//  AuthorizationMainView.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 12.02.24.
//

import SwiftUI

struct AuthorizationMainView: View {
    
    @State private var emailValue: String = ""
    @State private var emailBorderColor: Color = Color.custom.lightDarkC5
    
    @State private var passwordValue: String = ""
    @State private var passwordBorderColor: Color = Color.custom.lightDarkC5
    
    private var emailPlaceholder: LocalizedStringKey = LocalizedStringKey("E-mail address")
    private var passwordPlaceholder: LocalizedStringKey = LocalizedStringKey("Password")
    private var loginButtonText: LocalizedStringKey = LocalizedStringKey("Login")
    private var forgotPasswordButtonText: LocalizedStringKey = LocalizedStringKey("ForgotPassword")
    private var authorizationMainViewTitle: LocalizedStringKey = LocalizedStringKey("AuthorizationMainViewTitle")
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.custom.baseWhite
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Enter your email")
                            .foregroundStyle(Color.custom.lightDarkC2)
                            .font(.system(size: 14, weight: .regular))
                        TextInputView(textFieldValue: $emailValue, textFieldBorderColor: $emailBorderColor, textFieldIsSecureEntry: false, textFieldPlaceholder: emailPlaceholder, textFieldKeyboardType: .emailAddress)
                    }
                    .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Enter the password")
                            .foregroundStyle(Color.custom.lightDarkC2)
                            .font(.system(size: 14, weight: .regular))
                        TextInputView(textFieldValue: $passwordValue, textFieldBorderColor: $passwordBorderColor, textFieldIsSecureEntry: true, textFieldPlaceholder: passwordPlaceholder, textFieldKeyboardType: .asciiCapable)
                    }
                    
                    
                    ActionButton(buttonLableText: loginButtonText) {
                        print("Нажали кнопку Войти")
                    }
                    .padding(.top)
                    
                    VStack(alignment: .center) {
                        LabelButton(buttonLableText: forgotPasswordButtonText) {
                            print("Нажали кнопку Забыли пароль")
                        }
                    }
                    
                    DividerWithCenteredText()
                        .padding(.top)
                    
                    Spacer()
                    
                    Text("You don't have an account yet?")
                        .foregroundStyle(Color.custom.lightDarkC2)
                        .font(.system(size: 14, weight: .regular))
                }
                .padding(.horizontal)
            }
            .navigationTitle(authorizationMainViewTitle)
        }
    }
}

#Preview("WhiteRU") {
    AuthorizationMainView()
        .environment(\.locale, .init(identifier: "ru"))
        .preferredColorScheme(.light)
}

#Preview("DarkEN") {
    AuthorizationMainView()
        .environment(\.locale, .init(identifier: "en"))
        .preferredColorScheme(.dark)
}
