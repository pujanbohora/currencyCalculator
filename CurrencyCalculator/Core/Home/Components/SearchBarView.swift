//
//  SearchBarView.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/15/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .foregroundColor(.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            ///Singleton instance of UIApplication
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,
                    alignment: .trailing
                )
            
            
        }
        .font(.headline)
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.theme.background)
            .shadow(color: .theme.accent.opacity(0.15),
                    radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:0, y:0)
        )
        .padding()
    }
}

#Preview {
    ///Gourp for black and white color
    Group {
        ///LIght Mode
        SearchBarView(searchText: .constant(""))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        ///Dark Mode
        SearchBarView(searchText: .constant(""))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)    }
}

