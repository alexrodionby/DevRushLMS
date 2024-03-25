//
//  AuthorizationMainView.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 25.02.24.
//

import SwiftUI

struct AuthorizationMainView: View {
    
    @ObservedObject var authorizationVM: AuthorizationMainViewModel
    
    @State private var emailTextValue: String = .init()
    @State private var emailTextFieldBorderColor: Color = .lightDarkC5
    @State private var passwordTextValue: String = .init()
    @State private var passwordTextFieldBorderColor: Color = .lightDarkC5
    
    private var authorizationMainViewTitle: LocalizedStringKey = LocalizedStringKey("authorizationMainViewTitle")
    private var emailTextFieldLabel: LocalizedStringKey = LocalizedStringKey("emailTextFieldLabel")
    private var passwordTextFieldLabel: LocalizedStringKey = LocalizedStringKey("passwordTextFieldLabel")
    private var actionButtonText: LocalizedStringKey = LocalizedStringKey("authorizationMainViewActionButtonText")
    private var forgotPasswordValue: LocalizedStringKey = LocalizedStringKey("forgotPasswordValue")
    private var accountBottomLabelText: LocalizedStringKey = LocalizedStringKey("accountBottomLabelText")
    private var registerBottomLabelText: LocalizedStringKey = LocalizedStringKey("registerBottomLabelText")
    
    private var textFieldStackSpacing: CGFloat = 8
    private var mainStackSpacing: CGFloat = 16
    
    init(authorizationVM: AuthorizationMainViewModel) {
        self.authorizationVM = authorizationVM
    }
    
    var body: some View {
        NavigationStack(path: $authorizationVM.navigationPath) {
            ZStack {
                Color.baseWhiteDark
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .center, spacing: mainStackSpacing) {
                        
                        VStack(alignment: .leading, spacing: textFieldStackSpacing) {
                            Text(emailTextFieldLabel)
                                .foregroundStyle(.lightDarkC2)
                                .font(.system(size: 14, weight: .regular, design: .default))
                            EmailTextField(textFieldValue: $emailTextValue, textFieldBorderColor: $emailTextFieldBorderColor)
                        }
                        
                        VStack(alignment: .leading, spacing: textFieldStackSpacing) {
                            Text(passwordTextFieldLabel)
                                .foregroundStyle(.lightDarkC2)
                                .font(.system(size: 14, weight: .regular, design: .default))
                            PasswordTextField(textFieldValue: $passwordTextValue, textFieldBorderColor: $passwordTextFieldBorderColor)
                        }
                        
                        MainActionButton(buttonLableText: actionButtonText) {
                            print("--- Нажали на кнопку Войти ---")
                            authorizationVM.loginUser(inputData: ["email": emailTextValue,
                                                                  "password": passwordTextValue])
                        }
                        .padding(.top)
                        
                        NavigationLink(value: "forgotPassword") {
                            Text(forgotPasswordValue)
                        }
                        .foregroundStyle(.blue1)
                        .font(.system(size: 14, weight: .bold, design: .default))
                        
                        DividerWithText()
                            .padding(.top)
                        
                        Spacer()
                        
                        VStack {
                            Text(accountBottomLabelText)
                                .foregroundStyle(.lightDarkC2)
                                .font(.system(size: 14, weight: .regular, design: .default))
                            NavigationLink(value: "registration") {
                                Text(registerBottomLabelText)
                            }
                            .foregroundStyle(.blue1)
                            .font(.system(size: 14, weight: .bold, design: .default))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
            .navigationTitle(authorizationMainViewTitle)
            .navigationDestination(for: String.self) { text in
                switch text {
                case "forgotPassword":
                    ForgotPasswordMainView()
                case "registration":
                    RegistrationMainView()
                case "tabbar":
                    Text("tabbar")
                case "privacyPolicy":
                    PrivacyPolicyMainView()
                case "rulesOfService":
                    RulesOfServiceMainView()
                default:
                    Text("default view")
                }
            }
        }
        .environmentObject(authorizationVM)
    }
}

#Preview("WhiteRU") {
    AuthorizationMainView(authorizationVM: AuthorizationMainViewModel())
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview("DarkEn") {
    AuthorizationMainView(authorizationVM: AuthorizationMainViewModel())
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
