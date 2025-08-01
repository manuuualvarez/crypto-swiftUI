//
//  CoinModel.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 01/08/2025.
//
import Foundation

// CoinGecko API info
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON Response:
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 58908,
     "market_cap": 1100013258170,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1235028318246,
     "total_volume": 69075964521,
     "high_24h": 59504,
     "low_24h": 57672,
     "price_change_24h": 808.94,
     "price_change_percentage_24h": 1.39234,
     "market_cap_change_24h": 13240944103,
     "market_cap_change_percentage_24h": 1.21837,
     "circulating_supply": 18704250,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 64805,
     "ath_change_percentage": -9.24909,
     "ath_date": "2021-04-14T11:54:46.763Z",
     "atl": 67.81,
     "atl_change_percentage": 86630.1867,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2021-05-09T04:06:09.766Z",
     "sparkline_in_7d": {
       "price": [
         57812.96915967891,
         57504.33531773738,
       ]
     },
     "price_change_percentage_24h_in_currency": 1.3923423473152687
   }
 
 */


import Foundation


struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
    
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}

// MARK: - Mock Data for Previews
extension CoinModel {
    
    static let sampleSparkline = SparklineIn7D(price: [
        54000.0, 55000.0, 56000.0, 57000.0, 58000.0, 59000.0, 60000.0
    ])
    
    static let mockCoins: [CoinModel] = [
        CoinModel(
            id: "bitcoin",
            symbol: "btc",
            name: "Bitcoin",
            image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
            currentPrice: 96452.0,
            marketCap: 1908234567890,
            marketCapRank: 1,
            fullyDilutedValuation: 2025000000000,
            totalVolume: 32456789012,
            high24H: 97500.0,
            low24H: 95200.0,
            priceChange24H: 1234.56,
            priceChangePercentage24H: 1.29,
            marketCapChange24H: 24567890123,
            marketCapChangePercentage24H: 1.31,
            circulatingSupply: 19789567.0,
            totalSupply: 21000000.0,
            maxSupply: 21000000.0,
            ath: 108135.0,
            athChangePercentage: -10.8,
            athDate: "2021-11-10T14:24:11.849Z",
            atl: 67.81,
            atlChangePercentage: 142145.7,
            atlDate: "2013-07-06T00:00:00.000Z",
            lastUpdated: "2024-08-01T10:30:00.000Z",
            sparklineIn7D: sampleSparkline,
            priceChangePercentage24HInCurrency: 1.29,
            currentHoldings: nil
        ),
        
        CoinModel(
            id: "ethereum",
            symbol: "eth",
            name: "Ethereum",
            image: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
            currentPrice: 3456.78,
            marketCap: 415678901234,
            marketCapRank: 2,
            fullyDilutedValuation: 415678901234,
            totalVolume: 18234567890,
            high24H: 3502.45,
            low24H: 3398.12,
            priceChange24H: 67.89,
            priceChangePercentage24H: 2.01,
            marketCapChange24H: 8234567890,
            marketCapChangePercentage24H: 2.02,
            circulatingSupply: 120234567.0,
            totalSupply: 120234567.0,
            maxSupply: nil,
            ath: 4878.26,
            athChangePercentage: -29.1,
            athDate: "2021-11-10T14:24:19.604Z",
            atl: 0.432979,
            atlChangePercentage: 798456.2,
            atlDate: "2015-10-20T00:00:00.000Z",
            lastUpdated: "2024-08-01T10:30:00.000Z",
            sparklineIn7D: sampleSparkline,
            priceChangePercentage24HInCurrency: 2.01,
            currentHoldings: nil
        ),
        
        CoinModel(
            id: "tether",
            symbol: "usdt",
            name: "Tether USDt",
            image: "https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663",
            currentPrice: 1.001,
            marketCap: 126789012345,
            marketCapRank: 3,
            fullyDilutedValuation: 126789012345,
            totalVolume: 45678901234,
            high24H: 1.002,
            low24H: 0.999,
            priceChange24H: 0.001,
            priceChangePercentage24H: 0.1,
            marketCapChange24H: 123456789,
            marketCapChangePercentage24H: 0.1,
            circulatingSupply: 126654987654.0,
            totalSupply: 132456789012.0,
            maxSupply: nil,
            ath: 1.32,
            athChangePercentage: -24.2,
            athDate: "2018-07-24T00:00:00.000Z",
            atl: 0.572521,
            atlChangePercentage: 74.9,
            atlDate: "2015-03-02T00:00:00.000Z",
            lastUpdated: "2024-08-01T10:30:00.000Z",
            sparklineIn7D: SparklineIn7D(price: [1.0, 1.001, 0.999, 1.0, 1.001, 1.0, 1.001]),
            priceChangePercentage24HInCurrency: 0.1,
            currentHoldings: nil
        ),
        
        CoinModel(
            id: "binancecoin",
            symbol: "bnb",
            name: "BNB",
            image: "https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850",
            currentPrice: 612.34,
            marketCap: 88567890123,
            marketCapRank: 4,
            fullyDilutedValuation: 122345678901,
            totalVolume: 1234567890,
            high24H: 625.78,
            low24H: 598.45,
            priceChange24H: 15.67,
            priceChangePercentage24H: 2.62,
            marketCapChange24H: 2345678901,
            marketCapChangePercentage24H: 2.72,
            circulatingSupply: 144634633.0,
            totalSupply: 200000000.0,
            maxSupply: 200000000.0,
            ath: 686.31,
            athChangePercentage: -10.8,
            athDate: "2021-05-10T07:24:17.097Z",
            atl: 0.0398177,
            atlChangePercentage: 1537456.9,
            atlDate: "2017-10-19T00:00:00.000Z",
            lastUpdated: "2024-08-01T10:30:00.000Z",
            sparklineIn7D: sampleSparkline,
            priceChangePercentage24HInCurrency: 2.62,
            currentHoldings: nil
        ),
        
        CoinModel(
            id: "solana",
            symbol: "sol",
            name: "Solana",
            image: "https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422",
            currentPrice: 234.56,
            marketCap: 111234567890,
            marketCapRank: 5,
            fullyDilutedValuation: 135678901234,
            totalVolume: 5678901234,
            high24H: 245.67,
            low24H: 225.43,
            priceChange24H: 12.34,
            priceChangePercentage24H: 5.56,
            marketCapChange24H: 5890123456,
            marketCapChangePercentage24H: 5.59,
            circulatingSupply: 474234567.0,
            totalSupply: 578345678.0,
            maxSupply: nil,
            ath: 259.96,
            athChangePercentage: -9.8,
            athDate: "2021-11-06T21:54:35.825Z",
            atl: 0.500801,
            atlChangePercentage: 46734.2,
            atlDate: "2020-05-11T19:35:23.449Z",
            lastUpdated: "2024-08-01T10:30:00.000Z",
            sparklineIn7D: sampleSparkline,
            priceChangePercentage24HInCurrency: 5.56,
            currentHoldings: nil
        ),
        
        CoinModel(
            id: "ripple",
            symbol: "xrp",
            name: "XRP",
            image: "https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731",
            currentPrice: 2.89,
            marketCap: 165432109876,
            marketCapRank: 6,
            fullyDilutedValuation: 289000000000,
            totalVolume: 8901234567,
            high24H: 3.12,
            low24H: 2.76,
            priceChange24H: 0.23,
            priceChangePercentage24H: 8.65,
            marketCapChange24H: 13456789012,
            marketCapChangePercentage24H: 8.87,
            circulatingSupply: 57234567890.0,
            totalSupply: 99987234567.0,
            maxSupply: 100000000000.0,
            ath: 3.40,
            athChangePercentage: -15.0,
            athDate: "2018-01-07T00:00:00.000Z",
            atl: 0.00268621,
            atlChangePercentage: 107456.8,
            atlDate: "2014-05-22T00:00:00.000Z",
            lastUpdated: "2024-08-01T10:30:00.000Z",
            sparklineIn7D: sampleSparkline,
            priceChangePercentage24HInCurrency: 8.65,
            currentHoldings: nil
        ),
        
        CoinModel(
            id: "dogecoin",
            symbol: "doge",
            name: "Dogecoin",
            image: "https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256",
            currentPrice: 0.456789,
            marketCap: 67890123456,
            marketCapRank: 7,
            fullyDilutedValuation: nil,
            totalVolume: 3456789012,
            high24H: 0.478901,
            low24H: 0.434567,
            priceChange24H: 0.012345,
            priceChangePercentage24H: 2.78,
            marketCapChange24H: 1890123456,
            marketCapChangePercentage24H: 2.87,
            circulatingSupply: 148678901234.0,
            totalSupply: nil,
            maxSupply: nil,
            ath: 0.731578,
            athChangePercentage: -37.6,
            athDate: "2021-05-08T05:08:23.458Z",
            atl: 0.00008547,
            atlChangePercentage: 534256.7,
            atlDate: "2015-05-06T00:00:00.000Z",
            lastUpdated: "2024-08-01T10:30:00.000Z",
            sparklineIn7D: sampleSparkline,
            priceChangePercentage24HInCurrency: 2.78,
            currentHoldings: nil
        ),
        
        CoinModel(
            id: "cardano",
            symbol: "ada",
            name: "Cardano",
            image: "https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860",
            currentPrice: 1.234567,
            marketCap: 43567890123,
            marketCapRank: 8,
            fullyDilutedValuation: 55432109876,
            totalVolume: 2345678901,
            high24H: 1.287654,
            low24H: 1.198765,
            priceChange24H: 0.045678,
            priceChangePercentage24H: 3.84,
            marketCapChange24H: 1654321098,
            marketCapChangePercentage24H: 3.95,
            circulatingSupply: 35345678901.0,
            totalSupply: 45000000000.0,
            maxSupply: 45000000000.0,
            ath: 3.09,
            athChangePercentage: -60.0,
            athDate: "2021-09-02T06:00:10.474Z",
            atl: 0.01925275,
            atlChangePercentage: 6312.4,
            atlDate: "2020-03-13T02:22:55.391Z",
            lastUpdated: "2024-08-01T10:30:00.000Z",
            sparklineIn7D: sampleSparkline,
            priceChangePercentage24HInCurrency: 3.84,
            currentHoldings: nil
        )
    ]
}


