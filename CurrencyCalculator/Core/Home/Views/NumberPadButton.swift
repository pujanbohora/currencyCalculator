//
//  NumberPadButton.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/15/24.
//

import SwiftUI

struct NumberPadButton: View {
    
    let number: String
    let isRightSide: Bool
    let isFirstRowSide: Bool
    let action: () -> Void // Closure Function
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(
                    cornerRadius: 0
                ).foregroundColor(isFirstRowSide ? .theme.mediumtGrey : (isRightSide ? .theme.lightGrey : .theme.grey))
                Text(number)
                    .foregroundColor(isRightSide ? .theme.grey : .theme.secondaryText)
//                    .bold()
                    .font(.system(size: 32))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NumberPadButton(number: "1", isRightSide: false, isFirstRowSide: false) {
        
    }
    .previewLayout(.sizeThatFits)
}
