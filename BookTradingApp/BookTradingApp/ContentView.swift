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
            VStack(spacing:0){
                contentView
                menuView
                    .background(Color(UIColor(red: 248/255, green: 241/255, blue: 229/255, alpha: 1)))
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }

    
    private var contentView: some View{
        VStack{
            switch selectedMenu {
            case "home":
                HomeView(books: books, home: true)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Home")
                                .font(.title)
                                .bold()
                        }
                    }
                
            case "shelf":
                BookshelfView(books: books)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Bookshelf")
                                .font(.title)
                                .bold()
                        }
                    }
                
            case "profile":
                ProfileView(who: true, navigate: false)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Profile")
                                .font(.title)
                                .bold()
                        }
                    }
                
            case "discover":
                DiscoverView()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Discover")
                                .font(.title)
                                .bold()
                        }
                    }
            default:
                HomeView(books: books, home: true)
            }
        }
    }
    private var menuView: some View{
        HStack {
            Spacer()
            menuButton(icon: "house", menu: "home")
            Spacer()
            menuButton(icon: "magnifyingglass", menu: "discover")
            Spacer()
            menuButton(icon: "book", menu: "shelf")
            Spacer()
            menuButton(icon: "person", menu: "profile")
        }
        .frame(height: 64)
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
