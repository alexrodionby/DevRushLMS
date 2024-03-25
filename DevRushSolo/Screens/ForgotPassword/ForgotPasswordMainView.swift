//
//  ForgotPasswordMainView.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 21.03.24.
//

import SwiftUI

struct ForgotPasswordMainView: View {
    
    @EnvironmentObject var authorizationVM: AuthorizationMainViewModel
    
    private var forgotPasswordMainViewTitle: LocalizedStringKey = LocalizedStringKey("forgotPasswordMainViewTitle")
    private var emailTextFieldLabel: LocalizedStringKey = LocalizedStringKey("emailTextFieldLabel")
    private var actionSendButtonTextTitle: LocalizedStringKey = LocalizedStringKey("actionSendButtonTextTitle")
    
    @State private var emailTextValue: String = .init()
    @State private var emailTextFieldBorderColor: Color = .lightDarkC5
    
    private var textFieldStackSpacing: CGFloat = 8
    private var mainStackSpacing: CGFloat = 16
    
    var body: some View {
        ZStack {
            Color.baseWhiteDark
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: mainStackSpacing) {
                
                VStack(alignment: .leading, spacing: textFieldStackSpacing) {
                    Text(emailTextFieldLabel)
                        .foregroundStyle(.lightDarkC2)
                        .font(.system(size: 14, weight: .regular, design: .default))
                    EmailTextField(textFieldValue: $emailTextValue, textFieldBorderColor: $emailTextFieldBorderColor)
                }
                
                Spacer()
                
                MainActionButton(buttonLableText: actionSendButtonTextTitle) {
                    print("--- Нажали на кнопку Отправить ---")
                    /// Отработка нажатия кнопки отправить адрес почты
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .navigationTitle(forgotPasswordMainViewTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("WhiteRU") {
    NavigationView {
        ForgotPasswordMainView()
            .preferredColorScheme(.light)
            .environment(\.locale, .init(identifier: "ru"))
    }
}

#Preview("DarkEn") {
    NavigationView {
        ForgotPasswordMainView()
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "en"))
    }
}
