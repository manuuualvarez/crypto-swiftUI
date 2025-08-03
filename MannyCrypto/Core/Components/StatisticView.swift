//
//  StatisticView.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 03/08/2025.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.mySecondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.myAccent)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChange ?? 0) >=  0 ? 0 : 180)
                    )
                Text(stat.percentageChange?.asPercentString() ?? " ")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle(
                (stat.percentageChange ?? 0) >= 0
                ? Color.theme.myGreen
                : Color.theme.myRed
            )
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

#Preview("Light") {
    VStack(spacing: 8) {
        StatisticView(stat: StatisticModel.mockStatisticData[0])
        StatisticView(stat: StatisticModel.mockStatisticData[1])
        StatisticView(stat: StatisticModel.mockStatisticData[2])
    }
}

#Preview("Dark") {
    VStack(spacing: 8) {
        StatisticView(stat: StatisticModel.mockStatisticData[0])
        StatisticView(stat: StatisticModel.mockStatisticData[1])
        StatisticView(stat: StatisticModel.mockStatisticData[2])
    }
    .preferredColorScheme(.dark)
}
