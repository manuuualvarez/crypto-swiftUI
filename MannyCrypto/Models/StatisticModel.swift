//
//  StatisticModel.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 02/08/2025.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}


extension StatisticModel {
    static let mockStatisticData: [StatisticModel] = [
        .init(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34),
        .init(title: "Total Volume", value: "$1.23Tr"),
        .init(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)
    ]
}
