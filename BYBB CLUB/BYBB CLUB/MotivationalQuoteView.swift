//
//  MotivationalQuoteView.swift
//  BYBB CLUB
//
//  Created by Diego Rivera on 12/5/23.
//

import SwiftUI

struct MotivationalQuoteView: View {
    let quote: MotivationalQuote

    var body: some View {
        VStack {
            Text(quote.text)
                .font(.title)
                .multilineTextAlignment(.center)

            Text("- \(quote.author)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}
