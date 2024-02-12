//
//  HomeMainView.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 11.02.24.
//

import SwiftUI

struct HomeMainView: View {
    
    @State var emailTextFieldInput: String = ""
    @State var emailTextFieldBorderColor: Color = Color.custom.lightDarkC5
    @State var emailTextFieldShowRightIcon: Bool = true
    @State var emailTextFieldShowTextValue: Bool = true
    var defaultSearchText = LocalizedStringKey("Search a title...")
    
    var body: some View {
        Text("Пример текста с SF Pro Bold шрифтом")
            .font(.system(size: 14, weight: .bold))
        Text("Пример текста с SF Pro Regular шрифтом")
            .font(.system(size: 14, weight: .regular))
        
        Button("Show") {
            emailTextFieldShowTextValue.toggle()
        }
        
        TextInputView(textFieldValue: $emailTextFieldInput, textFieldBorderColor: $emailTextFieldBorderColor, textFieldShowRightInternalIcon: $emailTextFieldShowRightIcon, textFieldShowTextValue: $emailTextFieldShowTextValue, textFieldPlaceholder: defaultSearchText, textFieldKeyboardType: .emailAddress)
            .padding(32)
    }
}

#Preview {
    HomeMainView()
}
