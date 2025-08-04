//
//  CoinDataServices.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 01/08/2025.
//
import Foundation
import Combine

class CoinDataServices {
    @Published var allCoins: [CoinModel] = []
    var coinSuscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
            return
        }
        coinSuscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSuscription?.cancel()
            })
    }
}
