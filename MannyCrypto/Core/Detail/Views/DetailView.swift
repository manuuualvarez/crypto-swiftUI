//
//  DetailView.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 03/08/2025.
//

import SwiftUI

struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    @State private var showFullDescription: Bool = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                
                VStack(spacing: 20) {
                    overviewTitle
                    Divider()
                    
                    coinDescription
                    
                    overviewGrid
                    
                    additionalTitle
                    Divider()
                    additionalsGrid
                    
                    linksSection
                }
                .padding()
            }
        }
        .navigationTitle(vm.coin.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                navigationBarTrailingItems
            }
        }
    }
}

extension DetailView {
    
    private var navigationBarTrailingItems: some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.mySecondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
        .frame(width: 100)
    }
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.myAccent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTitle: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.myAccent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: nil,
            pinnedViews: []) {
                ForEach(vm.overviewStatistics) { stat in
                    StatisticView(stat: stat )
                }
            }
    }
    
    private var additionalsGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: nil,
            pinnedViews: []) {
                ForEach(vm.additionalStatistics) { stat in
                    StatisticView(stat: stat )
                }
            }
    }
    
    private var coinDescription: some View {
        ZStack {
            if let description = vm.coinDescription, !description.isEmpty {
                VStack {
                    Text(description)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundStyle(Color.theme.mySecondaryText)
                    Button(action: {
                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
                        }
                    }) {
                        Text(showFullDescription ? "Show less..." : "Read more...")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    }
                    .accentColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
    
    private var linksSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let website = vm.websiteURL, let url = URL(string: website) {
                Link("Website", destination: url)
            }
            
            if let reddit = vm.redditURL, let url = URL(string: reddit) {
                Link("Reddit", destination: url)
            }
        }
        .accentColor(.blue)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.headline)
    }
}

#Preview {
    NavigationView {
        DetailView(coin: CoinModel.mockCoins[0])
    }
}
