//
//  HomeView.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/16/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    private let buttons: [String] = ["1", "10", "100", "1k", "7", "8", "9", "÷", "4", "5", "6", "x", "1", "2", "3", "-", "0", ",", "☒", "+"]
    
    var body: some View {
        
        ZStack {

            VStack {
                    NavigationLink("Click me clike me click me") {
                        CurrencySelectionAndTextFieldView()
                    }

                CurrencySelectionAndTextFieldView()
                Spacer()

                Divider()
                    .overlay(Rectangle().foregroundColor(.theme.grey).frame(width: nil, height: 0.7))

//                CurrencySelectionAndTextFieldView()

                VStack(spacing: 1) {
                    allButtonList
                }.frame(height: UIScreen.main.bounds.width * 1.1)

                TLButton(title: "Convert", background: .theme.orange) {

                }.padding()

                Spacer()

            }
            .navigationTitle("Tesing")
        }
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}


extension HomeView {
    
    private var allButtonList: some View {
        ForEach(0..<buttons.count / 4, id: \.self) { rowIndex in
            rowButtonsItem(for: rowIndex)
        }
    }
    
    private func rowButtonsItem(for rowIndex: Int) -> some View {
        HStack(spacing: 1) {
            ForEach(0..<4, id: \.self) { columnIndex in
                let index = rowIndex * 4 + columnIndex
                let isRightSide = (index + 1) % 4 == 0
                let isFirstInRow = (rowIndex == 0)
                if index < buttons.count {
                    NumberPadButton(number: buttons[index], isRightSide: isRightSide, isFirstRowSide: isFirstInRow) {
                    }
//                    .frame(height: 90)
                } else {
                    Spacer()
                }
            }
        }
        
    }
    
   /*
    Second Option
    private var allButtonList: some View {
        let buttonIndices = 0..<buttons.count
        return LazyVGrid(columns: Array(repeating: GridItem(.flexible()),count: 4), spacing: 0) {
            ForEach(buttonIndices, id: \.self) { index in
                let isRightSide = (index + 1) % 4 == 0
                let isFirstInRow = index / 4 == 0 && index % 4 < 3
                return NumberPadButton(number: buttons[index], isRightSide: isRightSide, isFirstRowSide: isFirstInRow) {
                  // Button action here
                }
            }
        }
    }
    */
}

    

