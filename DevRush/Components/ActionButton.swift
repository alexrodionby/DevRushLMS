//
//  ActionButton.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 13.02.24.
//

import SwiftUI

struct ActionButton: View {
    
    var buttonLableText: LocalizedStringKey
    
    var buttonCornerRadius: CGFloat = 100
    var buttonBackgroundColor = Color.custom.baseGreen1
    var buttonHeight: CGFloat = 45
    
    var buttonTapAction: (() -> Void)?
    
    var body: some View {
        Button(action: {
            buttonTapAction?()
        }, label: {
            RoundedRectangle(cornerRadius: buttonCornerRadius, style: .continuous)
                .fill(buttonBackgroundColor)
                .frame(height: buttonHeight)
                .overlay(alignment: .center) {
                    Text(buttonLableText)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color.custom.baseWhite)
                }
        })
    }
}

#Preview {
    ActionButton(buttonLableText: "Войти")
        .padding()
        .preferredColorScheme(.light)
}
