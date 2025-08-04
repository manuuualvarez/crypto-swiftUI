//
//  CoinDetailDataService.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 03/08/2025.
//
import Foundation
import Combine

class CoinDetailDataService {
    @Published var coinDetails: CoinDetailModel?
    
    let coin: CoinModel
    var coinDetailsSuscription: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else {
            return
        }
        coinDetailsSuscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailsSuscription?.cancel()
            })
    }
}

