//
//  ProfileView.swift
//  BookTradingApp
//
//  Created by Rex Peter on 11/29/24.
//

import SwiftUI

//struct Book =
let email = "omr6@cornell.edu"
let

let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8"]

let columns = [
    GridItem(.flexible()) // Flexible row height
]

struct ProfileView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.self) { item in
                    // Content for each grid cell
                    Text(item)
                        .frame(maxWidth: .infinity, minHeight: 100)  // Make the items stretch
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ProfileView()
}
