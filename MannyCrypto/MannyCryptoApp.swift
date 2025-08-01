//
//  MannyCryptoApp.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 01/08/2025.
//

import SwiftUI

@main
struct MannyCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
