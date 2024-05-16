//
//  CurrencyConvertor.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/16/24.
//

import Foundation

struct Currency {
  let code: String
  let rate: Double
}

class CurrencyConverter {

  func convert(amount: Double, from currency: Currency, to target: Currency) -> Double {
    let conversionRate = target.rate / currency.rate
    return amount * conversionRate
  }

  func format(amount: Double, currencyCode: String) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = currencyCode
    return formatter.string(from: NSNumber(value: amount)) ?? ""
  }
}

