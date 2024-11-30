//
//  ContentView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedMenu: String = "home"
    
    var body: some View {
        VStack{
            Spacer()
            
            contentView
            
            menuView
                .frame(maxWidth: .infinity, maxHeight: 84)
                .background(Color(UIColor(red: 247/255, green: 243/255, blue: 236/255, alpha: 1.0)))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(radius: 5)
        
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
    private var contentView: some View{
        VStack{
            switch selectedMenu {
            case "home":
                HomeView(books: Book.DummyBooks)
            case "shelf":
                HomeView(books: Book.DummyBooks)
            case "profile":
                HomeView(books: Book.DummyBooks)
            default:
                HomeView(books: Book.DummyBooks)
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
