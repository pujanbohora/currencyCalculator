//
//  UIApplication.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/15/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    ///To close the keyboad; #selector Object C funcion
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
