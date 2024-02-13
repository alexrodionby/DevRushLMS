//
//  TextInputView.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 11.02.24.
//

import SwiftUI

struct TextInputView: View {
    
    @Binding var textFieldValue: String
    @Binding var textFieldBorderColor: Color
    
    @State private var textFieldShowTextValue: Bool = true
    
    var textFieldIsSecureEntry: Bool
    var textFieldPlaceholder: LocalizedStringKey
    var textFieldKeyboardType: UIKeyboardType
    var textFieldCornerRadius: CGFloat = 12
    var textFieldInternalPadding: CGFloat = 12
    var textFieldStrokeLineWidth: CGFloat = 1
    var textFieldHeight: CGFloat = 45
    
    var body: some View {
        HStack {
            if textFieldShowTextValue {
                TextField(textFieldPlaceholder, text: $textFieldValue)
                    .foregroundStyle(Color.custom.lightDarkC1)
                    .padding(textFieldInternalPadding)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(textFieldKeyboardType)
            } else {
                SecureField(textFieldPlaceholder, text: $textFieldValue)
                    .foregroundStyle(Color.custom.lightDarkC1)
                    .padding(textFieldInternalPadding)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(textFieldKeyboardType)
            }
            
            if textFieldIsSecureEntry {
                Button(action: {
                    textFieldShowTextValue.toggle()
                }) {
                    Image(systemName: textFieldShowTextValue ? "eye" : "eye.slash")
                        .foregroundColor(Color.custom.lightDarkC3)
                        .padding(textFieldInternalPadding)
                }
            }
        }
        .frame(height: textFieldHeight)
        .background(
            RoundedRectangle(cornerRadius: textFieldCornerRadius)
                .fill(Color.custom.lightDarkC6)
                .overlay(
                    RoundedRectangle(cornerRadius: textFieldCornerRadius)
                        .stroke(textFieldBorderColor, lineWidth: textFieldStrokeLineWidth)
                )
        )
        .onAppear {
            if textFieldIsSecureEntry {
                textFieldShowTextValue = false
            }
        }
    }
}

#Preview {
    TextInputView(textFieldValue: .constant(""), textFieldBorderColor: .constant(.custom.lightDarkC5), textFieldIsSecureEntry: false, textFieldPlaceholder: "Пароль...", textFieldKeyboardType: .emailAddress)
        .padding()
        .preferredColorScheme(.light)
}
