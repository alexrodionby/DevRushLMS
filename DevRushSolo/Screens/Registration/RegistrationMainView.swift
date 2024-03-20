//
//  RegistrationMainView.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 20.03.24.
//

import SwiftUI

struct RegistrationMainView: View {
    
    private var registrationMainViewTitle: LocalizedStringKey = LocalizedStringKey("registrationMainViewTitle")
    //   private var userNameTextFieldLabel: LocalizedStringKey = LocalizedStringKey("userNameTextFieldLabel")
    
    //  private var textFieldStackSpacing: CGFloat = 8
    private var mainStackSpacing: CGFloat = 16
    
    
    var body: some View {
        ZStack {
            Color.baseWhiteDark
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: mainStackSpacing) {
                
                
                
            }
            .padding(.horizontal)
            .padding(.top)
            
        }
        .onTapGesture {
            hideKeyboard()
        }
        .navigationTitle(registrationMainViewTitle)
        
        
    }
}

#Preview {
    RegistrationMainView()
}
