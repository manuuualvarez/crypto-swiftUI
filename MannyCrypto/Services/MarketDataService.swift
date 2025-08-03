//
//  MarketDataService.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 03/08/2025.
//
import Combine
import Foundation

class MarketDataService {
   
    @Published var marketData: MarketDataModel? = nil
    
    var marketDataSuscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
            return
        }
        marketDataSuscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSuscription?.cancel()
            })
    }
}
