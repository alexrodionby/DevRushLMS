//
//  TabbarMainView.swift
//  DevRushSolo
//
//  Created by Alexandr Rodionov on 4.03.24.
//

import SwiftUI

struct TabbarMainView: View {
    
    @StateObject var authorizationVM = AuthorizationMainViewModel()
    @StateObject var profileVM = ProfileMainViewModel()
    @ObservedObject var userData = UserDataGlobalModel.shared
    
    @State private var tabSelection = 1
    
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $tabSelection) {
                FeedMainView()
                    .tag(1)
                
                CoursesMainView()
                    .tag(2)
                
                LibrariesMainView()
                    .tag(3)
                
                ChatMainView()
                    .tag(4)
                
                ProfileMainView(profileMainVM: profileVM)
                    .tag(5)
            }
            .overlay(alignment: userData.isUserLoggedIn ? .bottom : .center) {
                if userData.isUserLoggedIn {
                    TabbarBottomView(tabSelection: $tabSelection, geometry: geometry.size)
                } else {
                    AuthorizationMainView(authorizationVM: authorizationVM)
                    
                }
            }
            .onAppear {
                userData.isUserAuthenticated()
            }
        }
    }
}

#Preview("WhiteRU") {
    TabbarMainView()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview("DarkEN") {
    TabbarMainView()
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
