//
//  HomeView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/29/24.
//

import SwiftUI
import Alamofire

struct HomeView: View {
    
    @State private var selectedCategory: String = "All"
    private var genres : [String] = ["All", "Romance", "Mystery", "Fantasy", "Sci-Fi", "History", "Poetry"]
    private var home : Bool
    
    @State var books: [Book]
    
    init(books: [Book], home: Bool) {
        self.books = books
        self.home = home
    }
    
    var body: some View {
            
        VStack(alignment: .leading){
            if home{
                GenreView(genres: genres, selectedCategory: $selectedCategory)
                    .padding(.top, 16)
                    .padding(.horizontal, 10)
            }
            
            
            ScrollView(.vertical){
                ForEach(selectedCategory == "All" ? books : books.filter{ $0.genre == selectedCategory } , id: \.self) { book in
                    bookInfoRow(book)
                }
                
            }
        }
        .padding(.horizontal, 20)
        .background{
            Constants.Colors.scholarYellow.ignoresSafeArea()
        }
        .onAppear{
            getAllBooks()
        }

    }
    
    func getAllBooks() {
        NetworkManager.shared.fetchAllBooks { result in
            DispatchQueue.main.async {
                self.books = result
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
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .safeAreaPadding(.top)
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Text(" \"\(book.quote)\"")
                        .fontWeight(.regular)
                        .italic()
                        .lineLimit(4)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Text(book.genre)
                        .foregroundStyle(.black)
                        
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding(10)
        }
    }
}

#Preview {
    HomeView(books: Book.DummyBooks, home: true)
}

