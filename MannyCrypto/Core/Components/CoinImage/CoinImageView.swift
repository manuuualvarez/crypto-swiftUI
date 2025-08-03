//
//  CoinImage.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 02/08/2025.
//
import SwiftUI

struct CoinImageView: View {
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
     ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.mySecondaryText)
            }
        }
    }
}

#Preview("Light") {
    CoinImageView(coin: CoinModel.mockCoins[0])
}

#Preview("Dark") {
    CoinImageView(coin: CoinModel.mockCoins[0])
        .preferredColorScheme(.dark)
}
