//
//  HomeViewModel.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 01/08/2025.
//
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(CoinModel.mockCoins[0])
            self.portfolioCoins.append(CoinModel.mockCoins[1])
            
        }
    }
}
