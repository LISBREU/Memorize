//
//  ContentView.swift
//  Memorize
//
//  Created by Ilnur Shabanov on 09.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
        CardView(isFaceUp: true)
        CardView()
        CardView()
        CardView()

        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 3)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}







#Preview {
    ContentView()
}
