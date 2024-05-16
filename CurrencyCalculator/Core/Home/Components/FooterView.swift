//
//  FooterView.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/15/24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        
        HStack {
            IconView(systemName: "arrow.clockwise", 
                     color: .theme.secondaryText)
                .rotationEffect(Angle(degrees: 60))
            Spacer()
            
            VStack {
                Text("15/05/2024, 20:39")
                    .foregroundColor(.theme.green)
                Text("1 NPR = 0.0075 USD")
                    .foregroundColor(.theme.grey)
            }
            Spacer()
            IconView(systemName: "info.circle", color: .theme.secondaryText)
        }
        .padding()
        
    }
}

#Preview {
    FooterView()
}
