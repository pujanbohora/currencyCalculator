//
//  CurrencyModel.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/16/24.
//

import Foundation


struct CurrencyModel: Codable {
    let baseCurrency, time: String?
    let timestamp: Int?
    let rates: [String: Double]
    
    
    enum CodingKeys : String, CodingKey {
        case baseCurrency = "base_currency"
        case time
        case timestamp
        case rates
    }
}
