//
//  HomeView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/29/24.
//

import SwiftUI

struct HomeView: View {
    
    let books: [Book]
    
    init(books: [Book]) {
        self.books = books
    }
    
    var body: some View {
            ZStack {
                
//                Color(UIColor(red: 247/255, green: 243/255, blue: 236/255, alpha: 1.0)).ignoresSafeArea()
                Color(.white).ignoresSafeArea()
                
                VStack{
                    
                    List(books, id: \.self) { book in
                        bookInfoRow(book)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.white)
//                            .listRowBackground(Color(UIColor(red: 247/255, green: 243/255, blue: 236/255, alpha: 1.0)))
                    }
                    .scrollContentBackground(.hidden)
                }
            }
    }
    

    private func bookInfoRow(_ book: Book) -> some View {
        NavigationLink{
            BookItemView(book: book)
        } label:{
            HStack {
                Image(book.image)
                    .resizable()
                    .frame(width: 139, height: 197)
                    .cornerRadius(8)
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text(book.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .safeAreaPadding(.top)
                    
                    Spacer()
                    
                    Text(" \"\(book.quote)\"")
                        .fontWeight(.medium)
                        .italic()
                        .lineLimit(4)
                    
                    Spacer()
                    
                    Text(book.genre)
                        .fontWeight(.thin)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding(10)
        }
    }

}

#Preview {
    HomeView(books: Book.DummyBooks)
}

