//
//  IconView.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/15/24.
//

import SwiftUI

struct IconView: View {
  let systemName: String
  let color: Color

  var body: some View {
    Image(systemName: systemName)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .foregroundColor(color)
      .frame(width: 25, height: 25)
  }
}


#Preview {
    IconView(systemName: "info", color: .theme.secondaryText)
}
