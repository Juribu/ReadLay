//
//  HomeView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/29/24.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        List(Book.DummyBooks, id: \.self) { book in
            bookInfoRow(book)
        }
        .navigationTitle("Birds List")
    }

    private func bookInfoRow(_ book: Book) -> some View {
        HStack {
            Image(book.image)
                .resizable()
                .frame(width: 100, height: 100)
            
            Spacer()
            
            VStack{
                Text(String(book.title))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(book.quote)
                    .fontWeight(.medium)
                    .italic()
                
                Text(book.quote)
                    .fontWeight(.medium)
                    .italic()
            }
        }
    }

}

#Preview {
    HomeView()
}

