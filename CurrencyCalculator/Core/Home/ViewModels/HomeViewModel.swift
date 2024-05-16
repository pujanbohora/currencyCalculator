//
//  HomeViewModel.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/16/24.
//

import Foundation
import Combine

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var marketData: CurrencyModel?
    private var marketDataService: MarketDataService
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        marketDataService = MarketDataService()
        bind()
    }
    
    private func bind() {
        marketDataService.$marketData
            .sink { [weak self] marketData in
                if let marketData = marketData {
                    self?.marketData = marketData
                }
            }
            .store(in: &cancellables)
    }
}

    
