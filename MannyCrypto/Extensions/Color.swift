//
//  Color+Extensions.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 01/08/2025.
//
import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
}

struct ColorTheme {
    let myAccent = Color("MyAccentColor")
    let myBackground = Color("MyBackgroundColor")
    let myGreen = Color("MyGreenColor")
    let myRed = Color("MyRedColor")
    let mySecondaryText = Color("MySecondaryTextColor")
}

struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}

