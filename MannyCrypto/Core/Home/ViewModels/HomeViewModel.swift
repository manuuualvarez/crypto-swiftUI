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
    @Published var statics: [StatisticModel] = StatisticModel.mockStatisticData
    @Published var searchText: String = ""
    
    private let dataService = CoinDataServices()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSuscribers()
    }
    
    func addSuscribers() {
        $searchText
            .combineLatest(dataService.$allCoins)
            // To improve the quickly typing keybord filtering
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] filterdCoins in
                self?.allCoins = filterdCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText)
            || coin.symbol.lowercased().contains(lowercasedText)
            || coin.id.lowercased().contains(lowercasedText)
        }
    }
}
