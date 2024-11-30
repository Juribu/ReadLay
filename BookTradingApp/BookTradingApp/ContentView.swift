//
//  ContentView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedMenu: String = "home"
    @State private var selectedCategory: String = "All"
    @State private var likes: [String] = UserDefaults.standard.array(forKey: "likes") as? [String] ?? []
    
    let books: [Book] = Book.DummyBooks
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(UIColor(red: 247/255, green: 243/255, blue: 236/255, alpha: 1.0)).ignoresSafeArea()
                VStack{
                    
                    
                    Spacer()
                    contentView
                    
                    menuView
                        .frame(maxWidth: .infinity, maxHeight: 84)
                        .background(Color(UIColor(red: 230/255, green: 255/255, blue: 210/255, alpha: 1.0)))
//                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//                        .shadow(radius: 5)
                    
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }

    private var genreView: some View{
        HStack(spacing: 18){
            genreButton(genre: "All")
            genreButton(genre: "Sci-Fi")
        }
    }
    
    private func genreButton(genre: String) -> some View{
        Button{
            selectedCategory = genre
        } label: {
            Text(genre)
                .padding(.horizontal, 18)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(12)
                .bold(selectedCategory == genre ? true : false)
        }
    }
    
    private var contentView: some View{
        VStack{
            switch selectedMenu {
            case "home":
                genreView
                HomeView(books: books)
            case "shelf":
                BookshelfView(books: books)
            case "profile":
                ProfileView()
            default:
                HomeView(books: books)
            }
        }
    }
    private var menuView: some View{
        HStack {
            menuButton(icon: "house", menu: "home")
            menuButton(icon: "book", menu: "shelf")
            menuButton(icon: "person", menu: "profile")
//            Image(systemName: "magnifyingglass")
//                .imageScale(.large)
//                .padding(30)
        }
    }
    
    private func menuButton(icon: String, menu: String) -> some View{
        Button{
            selectedMenu = menu
        } label: {
            Image(systemName: icon)
                .imageScale(.large)
                .padding(30)
                .foregroundColor(.black)
                .bold(selectedMenu == menu ? true : false)
        }
    }
}


#Preview {
    ContentView()
}
