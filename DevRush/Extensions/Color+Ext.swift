//
//  Color+Ext.swift
//  DevRush
//
//  Created by Alexandr Rodionov on 11.02.24.
//

// Добавляем кастомные цвета к стандартным

import Foundation
import SwiftUI

extension Color {
    static let custom = CustomColors()
}

struct CustomColors {
    let baseBlue1 = Color("baseBlue1")
    let baseBlue2 = Color("baseBlue2")
    let baseGreen1 = Color("baseGreen1")
    let baseGreen2 = Color("baseGreen2")
    let baseGreen3 = Color("baseGreen3")
    let baseGreen4 = Color("baseGreen4")
    let baseGreen5 = Color("baseGreen5")
    let basePink1 = Color("basePink1")
    let basePink2 = Color("basePink2")
    let basePurple1 = Color("basePurple1")
    let basePurple2 = Color("basePurple2")
    let basePurple3 = Color("basePurple3")
    let baseRed = Color("baseRed")
    let lightDarkC1 = Color("lightDarkC1")
    let lightDarkC2 = Color("lightDarkC2")
    let lightDarkC3 = Color("lightDarkC3")
    let lightDarkC4 = Color("lightDarkC4")
    let lightDarkC5 = Color("lightDarkC5")
    let lightDarkC6 = Color("lightDarkC6")
    let baseWhite = Color("baseWhite")
}
