//
//  CurrencySelectionAndTextFieldView.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/15/24.
//

import SwiftUI

struct CurrencySelectionAndTextFieldView: View {
    
    var body: some View {
        
        HStack {
            VStack {
                Image(systemName: "flag.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .frame(width: 40, height: 40)
                    .background(Color.theme.background)
                    .clipShape(Circle())
                Text("NRP")
                    .font(.caption)
            }

            Spacer()
            
            Text("0")
                .font(.largeTitle)
                .scaleEffect(1.2)
        }
        .padding()
    }
}

#Preview {
    CurrencySelectionAndTextFieldView()
}
