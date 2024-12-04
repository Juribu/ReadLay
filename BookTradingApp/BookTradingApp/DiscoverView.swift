//
//  DiscoverView.swift
//  BookTradingApp
//
//  Created by Oshin Rex on 11/30/24.
//

import SwiftUI

struct DiscoverView: View {
    @State private var currentIndex = 0
    @State private var cards = [
        "Card 1",
        "Card 2",
        "Card 3",
        "Card 4",
        "Card 5"
    ]
    
    var body: some View {
        VStack{
            Spacer()
            
        ZStack {
            ForEach(cards.indices, id: \.self) { index in
                if index >= self.currentIndex {
                    CardView(card: self.cards[index], currentIndex: self.$currentIndex)
                        .zIndex(Double(cards.count - index))
                }
                else {
                    Text("no cards left")
                }
            }
        }
            
            Spacer()
        }
    }
}

struct CardView: View {
    var card: String
    @Binding var currentIndex: Int
    @State private var offset = CGSize.zero
    
    var body: some View {
        VStack {
            Text(card)
                .font(.largeTitle)
                .padding()
                .frame(width: 300, height: 400)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 2)
        }
        .offset(x: offset.width, y: offset.height)
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.offset = value.translation
                }
                .onEnded { value in
                    if abs(self.offset.width) > 100 {
                        self.handleSwipe(value: value)
                    } else {
                        self.resetCardPosition()
                    }
                }
        )
    }

    private func handleSwipe(value: DragGesture.Value) {
        if value.translation.width > 0 {
            // Right swipe
            
            print("Swiped Right")
        } else {
            // Left swipe
            print("Swiped Left")
        }

        // Remove the current card from the stack
        withAnimation {
            self.offset = CGSize(width: 1000 * (value.translation.width > 0 ? 1 : -1), height: 0)
        }

        // Increase the index to remove the card from view
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.currentIndex += 1
        }
    }

    private func resetCardPosition() {
        self.offset = .zero
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
