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
    
    let books: [Book] = Book.DummyBooks
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing:0){
                contentView
                menuView
                    .background(Constants.Colors.scholarYellow)
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden()
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
                    .toolbar{
                        ToolbarItem(placement:.topBarTrailing){
                            NavigationLink{
                                LogInView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text("Logout")
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                
            case "discover":
                DiscoverView(cards: Book.DummyBooks)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Swiper")
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
            menuButton(icon: "magnifyingglass.circle", menu: "discover")
            Spacer()
            menuButton(icon: "books.vertical", menu: "shelf")
            Spacer()
            menuButton(icon: "person", menu: "profile")
        }
        .frame(height: 64)
    }
    
    private func menuButton(icon: String, menu: String) -> some View{
        Button{
            selectedMenu = menu
        } label: {
            Image(systemName: selectedMenu == menu ? icon + ".fill" : icon)
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
