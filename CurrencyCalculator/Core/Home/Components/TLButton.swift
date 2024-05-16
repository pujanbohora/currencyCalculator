//
//  TLButton.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/16/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void // Closure Function
    
    var body: some View {
        Button{
            //Attempt log in
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.theme.buttonColor)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.title3)
            }
        }.frame(height: 65)

    }
}

#Preview {
    TLButton(title: "Value", background: .theme.orange) {
        //Action Button
    }
}

