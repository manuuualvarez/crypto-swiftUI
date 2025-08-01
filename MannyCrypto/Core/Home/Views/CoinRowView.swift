//
//  CoinRowView.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 01/08/2025.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingColumn {
                centerColumn
            }
            rightColumn

        }
        .font(.subheadline)
    }
}

#Preview("Light") {
    CoinRowView(
        coin: CoinModel.mockCoins[0],
        showHoldingColumn: true
    )
    .preferredColorScheme(.light)
}

#Preview("Dark") {
    CoinRowView(
        coin: CoinModel.mockCoins[0],
        showHoldingColumn: true
    )
    .preferredColorScheme(.dark)
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.mySecondaryText)
                .frame(minWidth: 30)
            
            Circle()
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.myAccent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(Color.theme.myAccent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text("\(coin.currentPrice.asCurrencyWith2Decimals())")
                .bold()
                .foregroundStyle(Color.theme.myAccent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? " ")
                .foregroundStyle (
                    (coin.priceChangePercentage24H ?? 0) >= 0
                    ? Color.theme.myGreen
                    : Color.theme.myRed
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
