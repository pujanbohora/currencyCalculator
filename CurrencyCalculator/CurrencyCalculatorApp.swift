//
//  CurrencyCalculatorApp.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/15/24.
//



import SwiftUI

@main
struct CurrencyCalculatorApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
