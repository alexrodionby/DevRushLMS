//
//  TabbarMainView.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 11.02.24.
//

import SwiftUI

struct TabbarMainView: View {
    
    @State private var tabSelection = 1
    
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $tabSelection) {
                HomeMainView()
                    .tag(1)
                
                CoursesMainView()
                    .tag(2)
                
                LibrariesMainView()
                    .tag(3)
                
                ChatMainView()
                    .tag(4)
            }
            .overlay(alignment: .bottom) {
                TabBottomView(tabSelection: $tabSelection, geometry: geometry.size)
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
