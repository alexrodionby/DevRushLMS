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
    @Binding var textFieldShowRightInternalIcon: Bool
    @Binding var textFieldShowTextValue: Bool
    var textFieldPlaceholder: LocalizedStringKey
    var textFieldKeyboardType: UIKeyboardType
    var textFieldCornerRadius: CGFloat = 12
    var textFieldInternalPadding: CGFloat = 12
    var textFieldLineWidth: CGFloat = 1
    
    var body: some View {
        HStack {
            TextField(textFieldPlaceholder, text: $textFieldValue)
                .foregroundStyle(Color.custom.lightDarkC1)
                .padding(textFieldInternalPadding)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .keyboardType(textFieldKeyboardType)
                .overlay(alignment: .trailing) {
                    if textFieldShowRightInternalIcon {
                        Image(textFieldShowTextValue == true ? "eye" : "eyeClosed")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color.custom.lightDarkC3)
                            .padding(textFieldInternalPadding)
                    }
                }
        }
        .background {
            RoundedRectangle(cornerRadius: textFieldCornerRadius)
                .fill(Color.custom.lightDarkC6)
                .stroke(textFieldBorderColor, lineWidth: textFieldLineWidth)
        }
    }
}

#Preview {
    TextInputView(textFieldValue: .constant(""), textFieldBorderColor: .constant(.custom.lightDarkC5), textFieldShowRightInternalIcon: .constant(true), textFieldShowTextValue: .constant(true), textFieldPlaceholder: "placeholder", textFieldKeyboardType: .emailAddress)
        .padding()
        .preferredColorScheme(.dark)
    
}
