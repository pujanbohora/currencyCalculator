//
//  Color.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/15/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
            let red = Double((hexNumber & 0xff0000) >> 16) / 255.0
            let green = Double((hexNumber & 0x00ff00) >> 8) / 255.0
            let blue = Double(hexNumber & 0x0000ff) / 255.0
            self.init(red: red, green: green, blue: blue)
            return
        }

        self.init(red: 0, green: 0, blue: 0)
    }
}

extension Color {
  static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color(hex: "#fe9c38")
    let orange = Color(hex: "#fe9c38")
    let background = Color(hex: "#141515")
    let lightBlack = Color(hex: "#464646")
    let grey = Color(hex: "#656565")
    let lightGrey = Color(hex: "#cfcdcd")
    let mediumtGrey = Color(hex: "#949594")
    let secondaryText = Color(hex: "#ffffff")
    let green = Color(hex: "#36b899")
    let buttonColor = Color(hex: "#ff6e4f")
}

