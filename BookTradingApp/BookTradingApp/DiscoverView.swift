//
//  DiscoverView.swift
//  BookTradingApp
//
//  Created by Oshin Rex on 11/30/24.
//

import SwiftUI

struct DiscoverView: View {
    @State private var currentIndex = 0
    @State private var cards: [Book]
    private var lastCard = Book(id: "", title: "", author: "", description: "", image: "", quote: "", genre: "", username: "")
    
    init(cards: [Book]) {
        self.cards = cards
    }
    
    var body: some View {
        
        ZStack{
            Constants.Colors.scholarYellow.ignoresSafeArea()
            VStack{
                
                Spacer()
                
                ZStack{
                    ForEach(cards.indices, id: \.self) { index in
                        if index >= self.currentIndex {
                            CardView(card: self.cards[index], currentIndex: self.$currentIndex)
                                .zIndex(Double(cards.count - index))
                                .ignoresSafeArea()
                                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        } else {
                            Text("You've explored all!")
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
    
}

struct CardView: View {
    var card: Book
    @Binding var currentIndex: Int
    @State private var offset = CGSize.zero
    
    var body: some View {
        VStack {
            Spacer()
            Image(card.image)
                .resizable()
                .frame(width: 233, height: 347)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 2)
            
            HStack(alignment: .top){
                displayTitleAndAuthor(book: card)
                
                Spacer()
                
                NavigationLink{
                    ProfileView(who: false, navigate: true)
                }label: {
                    displaySellerPfp
                }
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .background{
            LinearGradient(
                gradient: Gradient(colors: [Constants.Colors.scholarYellow, Color(UIColor(red: 221/255, green: 178/255, blue: 110/255, alpha: 1)), Constants.Colors.scholarYellow]),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
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
    
    private func displayTitleAndAuthor(book: Book) -> some View {
        VStack(alignment: .leading){
            Text(book.title)
                .font(.custom("Baskerville", size: 32))
                .multilineTextAlignment(.leading)
                .bold()
                .padding(.bottom, 2)
            Text(book.author)
                .font(.system(size: 10))
                .padding(.bottom, 12)
            Text("\"\(book.quote)\"")
                .font(.custom("Baskerville", size: 24))
//                .font(.system(size: 24, weight: .medium))
                .fontWeight(.medium)
                .padding(.bottom)
            
            Text(book.description)
                .font(.custom("Baskerville", size: 14))
                .italic()
                .padding(.bottom, 8)
            Text(book.genre)
                .font(.custom("Baskerville", size: 12))
                .italic()
        }
    }
    
    private var displaySellerPfp: some View {
        Image("profile")
            .resizable()
            .frame(width: 50, height: 50)
    }
}



#Preview {
    DiscoverView(cards: Book.DummyBooks)
}
