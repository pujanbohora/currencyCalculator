//
//  PreviewProvider.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/16/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

//Singleton
class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    
}

