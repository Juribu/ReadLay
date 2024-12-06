//
//  tablView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 12/3/24.
//

import SwiftUI

struct tabView: View{
    
    let books: [Book] = Book.DummyBooks
    
    init() {
            UITabBar.appearance().backgroundColor = UIColor.systemGray6
            UITabBar.appearance().isTranslucent = false
        }
    
    var body : some View{
        NavigationStack{
            TabView{
                tabItem(label: "Home", title: "Home", imageString: "house")
                tabItem(label: "Discover", title: "Discover", imageString: "magnifyingglass")
                tabItem(label: "Shelf", title: "Shelf", imageString: "books.vertical")
                tabItem(label: "Profile", title: "Profile", imageString: "person")
            }
        }
    }
    
    private func tabItem(label: String, title: String, imageString: String) -> some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(UIColor.systemCyan))
    
                .foregroundColor(.white)
            
            switch (label){
            case "Home":
                HomeView(books: books, home: true)
            case "Discover":
                DiscoverView(cards: Book.DummyBooks)
            case "Shelf":
                BookshelfView(books: books)
            case "Profile":
                ProfileView(who: true, navigate: false)
            default:
                HomeView(books: books, home: true)
            }
        }
            .tabItem {
                Label(label, systemImage: imageString)
            }
    }
}

#Preview {
    tabView()
}
