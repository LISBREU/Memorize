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
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                        base.fill(.white)
                    .strokeBorder(lineWidth: 3)
                Text("👻").font(.largeTitle)
            } else {
                base.fill()
            }
        } .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
 






#Preview {
    ContentView()
}
