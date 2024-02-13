//
//  LabelButton.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 13.02.24.
//

import SwiftUI

struct LabelButton: View {
    
    var buttonLableText: LocalizedStringKey
    
    var buttonFontSize: CGFloat = 14
    var buttonFontWeight: Font.Weight = .semibold
    var buttonFontColor: Color = Color.custom.basePink1
    
    var buttonTapAction: (() -> Void)?
    
    var body: some View {
        Button(action: {
            buttonTapAction?()
        }, label: {
            Text(buttonLableText)
                .font(.system(size: buttonFontSize, weight: buttonFontWeight))
                .foregroundStyle(buttonFontColor)
        })
    }
}

#Preview {
    LabelButton(buttonLableText: "Забыли пароль?")
        .padding()
        .preferredColorScheme(.light)
}
