//
//  HomeStatsView.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 03/08/2025.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    
    var body: some View {
        HStack {
            ForEach(vm.statics) { stat in
                    StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(
            width: UIScreen.main.bounds.width,
            alignment: showPortfolio ? .trailing : .leading
        )
    }
}

#Preview("Light") {
    HomeStatsView(showPortfolio: .constant(true))
        .environmentObject(HomeViewModel())
}

#Preview("Dark") {
    HomeStatsView(showPortfolio: .constant(false))
        .preferredColorScheme(.dark)
        .environmentObject(HomeViewModel())
}
