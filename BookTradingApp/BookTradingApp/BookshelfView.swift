//
//  BookshelfView.swift
//  BookTradingApp
//
//  Created by Oshin Rex on 11/29/24.
//

import SwiftUI

struct BookshelfView: View {
    let books: [Book]
    
    init(books: [Book]) {
        self.books = books
    }
    
    private var numberOfRows: Int {
        return (books.count + 2) / 3
    }
    
    var body: some View {
            NavigationView{
                ScrollView{
                    VStack(spacing: 100) {
                        ForEach(0..<numberOfRows, id: \.self) { row in
                            ZStack(alignment: .bottom){
                                Color(UIColor(red: 248/255, green: 241/255, blue: 229/255, alpha: 1)).ignoresSafeArea()
                                
                                HStack(spacing: 20) {
                                    ForEach(0..<3) { index in
                                        let bookIndex = row * 3 + index
                                        if bookIndex < books.count {
                                            bookInfoRow(book: books[bookIndex])
                                        }
                                    }
                                }
                                .zIndex(1)
                                .offset(y: -7)
                                
                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color(UIColor(red: 108/255, green: 71/255, blue: 12/255, alpha: 1)), Color(UIColor(red: 221/255, green: 178/255, blue: 110/255, alpha: 1))]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .frame(height: 15)
                                    .shadow(radius: 2)
                                    .zIndex(0)
                                
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 50)
                }
                .background {
                    Color(UIColor(red: 248/255, green: 241/255, blue: 229/255, alpha: 1))
                        .ignoresSafeArea()
                }
                
            
        }
    }
    
    private func bookInfoRow(book: Book) -> some View {
            VStack {
                NavigationLink(destination: BookItemView(book: book)) {
                    Image(book.image)
                        .resizable()
                }
            }
            .frame(width: 90, height: 125)
            .cornerRadius(8)
    }
}

#Preview {
    BookshelfView(books: Book.DummyBooks)
}
