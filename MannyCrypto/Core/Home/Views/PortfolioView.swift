//
//  PortfolioView.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 03/08/2025.
//

import SwiftUI

struct PortfolioView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckMark: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(action: {
                        dismiss()
                    })
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    saveButton
                }
            }
            .onChange(of: vm.searchText) { _, newValue in
                if newValue == "" {
                    removeSelectedCoin()
                }
            }
        }
    }
}


extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(spacing: 10) {
                ForEach(
                    vm.searchText.isEmpty
                    ? vm.portfolioCoins
                    : vm.allCoins
                ) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    selectedCoin?.id == coin.id
                                    ? Color.theme.myGreen
                                    : Color.clear,
                                    lineWidth: 1
                                )
                        )
                }
            }
            .frame(height: 120)
            .padding(.leading)
        })
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? " "):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? " ")
            }
            Divider()
            HStack {
                Text("Amount holding")
                Spacer()
                TextField("Ex. 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .animation(nil, value: selectedCoin?.id)
        .padding()
        .font(.headline)
    }
    
    private var saveButton: some View {
        HStack(spacing: 10) {
            if showCheckMark {
                Image(systemName: "checkmark")
                    .foregroundStyle(Color.theme.myGreen)
                    .opacity(showCheckMark ? 1.0 : 0.0)
            }
            Button {
                saveButtonPressed()
            } label: {
                Text("Save")
            }
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0
            )
        }
        .font(.headline)
    }
    
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        if let portFolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }), let amount = portFolioCoin.currentHoldings {
                quantityText = "\(amount)"
        } else {
            quantityText = ""
        }
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private func saveButtonPressed() {
        guard let coin = selectedCoin, let amount = Double(quantityText) else {
            return
        }
        // Save to portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        // Show Checkmark
        withAnimation(.easeIn) {
            showCheckMark = true
        }
        // Hide Keyboard
        UIApplication.shared.endEditing()
        // Hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckMark = false
                dismiss()
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
}

#Preview {
    PortfolioView()
        .environmentObject(HomeViewModel())
}

