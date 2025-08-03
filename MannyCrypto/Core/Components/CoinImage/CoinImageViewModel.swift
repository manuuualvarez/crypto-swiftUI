//
//  CoinImageViewModel.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 02/08/2025.
//
import Combine
import SwiftUI

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    
    private var cancellables = Set<AnyCancellable>()
    
    init (coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        addSuscribers()
        self.isLoading = true
    }
    
    private func addSuscribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] image in
                self?.image = image
            }
            .store(in: &cancellables)
    }
}
