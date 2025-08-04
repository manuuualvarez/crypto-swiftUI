//
//  SettingsView.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 04/08/2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let linkedindURL = URL(string: "https://www.linkedin.com/in/manuelignacioalvarez/")!
    let githubURL = URL(string: "https://github.com/manuuualvarez")!
    let repository = URL(string: "https://github.com/manuuualvarez/crypto-swiftUI.git")!
    let myWebsite = URL(string: "https://manuelalvarez.vercel.app/")!
    let coingeko = URL(string: "https://www.coingecko.com/en")!
    
    var body: some View {
        NavigationView {
            List {
                aboutMe
                coinGecko
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton(action: { dismiss() })
                }
            }
        }
    }
}

extension SettingsView {
    private var aboutMe: some View {
        Section(header: Text("Manuel Alvarez")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app it used to show my skills on SwiftUI. It uses MVVM Architecture, Combine and CoreData")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.myAccent)
            }
            .padding(.vertical)
            Link("Linkedin 🧑🏼‍💻", destination: linkedindURL)
            Link("Github 😺", destination: githubURL)
            Link("This repo 🗒️", destination: repository)
            Link("My Website 💻", destination: myWebsite)
        }
    }
    
    private var coinGecko: some View {
        Section(header: Text("Coin Gecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko!. Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.myAccent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coingeko)
        }
    }
}

#Preview {
    SettingsView()
}
