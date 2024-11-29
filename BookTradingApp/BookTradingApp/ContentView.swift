//
//  ContentView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedMenu: String = "Home"
    
    var body: some View {
        VStack{
            Spacer()
            
            
            
            
            HStack {
                Image(systemName: "house")
                    .imageScale(.large)
                    .padding(30)
                
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                    .padding(30)
                Image(systemName: "book")
                    .imageScale(.large)
                    .padding(30)
                Image(systemName: "person")
                    .imageScale(.large)
                    .padding(30)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
