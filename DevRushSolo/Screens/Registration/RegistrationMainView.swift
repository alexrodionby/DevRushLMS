//
//  RegistrationMainView.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 20.03.24.
//

import SwiftUI

struct RegistrationMainView: View {
    
    @EnvironmentObject var authorizationVM: AuthorizationMainViewModel
    
    private var registrationMainViewTitle: LocalizedStringKey = LocalizedStringKey("registrationMainViewTitle")
    private var userNameTextFieldLabel: LocalizedStringKey = LocalizedStringKey("userNameTextFieldLabel")
    private var userNameTextFieldPlaceholder: LocalizedStringKey = LocalizedStringKey("userNameTextFieldPlaceholder")
    private var emailTextFieldLabel: LocalizedStringKey = LocalizedStringKey("emailTextFieldLabel")
    private var passwordTextFieldLabel: LocalizedStringKey = LocalizedStringKey("passwordTextFieldLabel")
    private var secondPasswordTextFieldLabel: LocalizedStringKey = LocalizedStringKey("secondPasswordTextFieldLabel")
    private var actionButtonText: LocalizedStringKey = LocalizedStringKey("registrationMainViewActionButtonText")
    private var accountRegistrationBottomLabelText: LocalizedStringKey = LocalizedStringKey("accountRegistrationBottomLabelText")
    private var privacyPolicyLabelText: LocalizedStringKey = LocalizedStringKey("privacyPolicyLabelText")
    private var rulesOfServiceLabelText: LocalizedStringKey = LocalizedStringKey("rulesOfServiceLabelText")
    private var accountEnterTitleText: LocalizedStringKey = LocalizedStringKey("accountEnterTitleText")
    private var accountEnterBottomLabelText: LocalizedStringKey = LocalizedStringKey("accountEnterBottomLabelText")
    
    private var textFieldStackSpacing: CGFloat = 8
    private var mainStackSpacing: CGFloat = 16
    
    @State private var userNameTextValue: String = .init()
    @State private var userNameTextFieldBorderColor: Color = .lightDarkC5
    @State private var emailTextValue: String = .init()
    @State private var emailTextFieldBorderColor: Color = .lightDarkC5
    @State private var passwordTextValue: String = .init()
    @State private var passwordTextFieldBorderColor: Color = .lightDarkC5
    @State private var secondPasswordTextValue: String = .init()
    @State private var secondPasswordTextFieldBorderColor: Color = .lightDarkC5
    
    var body: some View {
        ZStack {
            Color.baseWhiteDark
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center, spacing: mainStackSpacing) {
                    
                    VStack(alignment: .leading, spacing: textFieldStackSpacing) {
                        Text(userNameTextFieldLabel)
                            .foregroundStyle(.lightDarkC2)
                            .font(.system(size: 14, weight: .regular, design: .default))
                        EmailTextField(textFieldValue: $userNameTextValue, textFieldBorderColor: $userNameTextFieldBorderColor, textFieldPlaceholder: userNameTextFieldPlaceholder)
                    }
                    
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
                    
                    VStack(alignment: .leading, spacing: textFieldStackSpacing) {
                        Text(secondPasswordTextFieldLabel)
                            .foregroundStyle(.lightDarkC2)
                            .font(.system(size: 14, weight: .regular, design: .default))
                        PasswordTextField(textFieldValue: $secondPasswordTextValue, textFieldBorderColor: $secondPasswordTextFieldBorderColor)
                    }
                    
                    MainActionButton(buttonLableText: actionButtonText) {
                        print("--- Нажали на кнопку Зарегистрироваться ---")
                        /// Отработка регистрации
                    }
                    .padding(.top)
                    
                    VStack {
                        Text(accountRegistrationBottomLabelText)
                            .foregroundStyle(.lightDarkC2)
                            .font(.system(size: 14, weight: .regular, design: .default))
                        
                        NavigationLink(value: "privacyPolicy") {
                            Text(privacyPolicyLabelText)
                        }
                        .foregroundStyle(.blue1)
                        .font(.system(size: 14, weight: .bold, design: .default))
                        
                        NavigationLink(value: "rulesOfService") {
                            Text(rulesOfServiceLabelText)
                        }
                        .foregroundStyle(.blue1)
                        .font(.system(size: 14, weight: .bold, design: .default))
                    }
                    
                    DividerWithText()
                        .padding(.top)
                    
                    Spacer()
                    
                    VStack {
                        Text(accountEnterTitleText)
                            .foregroundStyle(.lightDarkC2)
                            .font(.system(size: 14, weight: .regular, design: .default))
                        
                        Button {
                            authorizationVM.navigationPath.removeLast()
                        } label: {
                            Text(accountEnterBottomLabelText)
                                .foregroundStyle(.blue1)
                                .font(.system(size: 14, weight: .bold, design: .default))
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .navigationTitle(registrationMainViewTitle)
    }
}

#Preview("WhiteRU") {
    NavigationView {
        RegistrationMainView()
            .preferredColorScheme(.light)
            .environment(\.locale, .init(identifier: "ru"))
    }
}

#Preview("DarkEn") {
    NavigationView {
        RegistrationMainView()
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "en"))
    }
}
