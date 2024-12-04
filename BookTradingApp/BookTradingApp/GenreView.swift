//
//  GenreView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 12/3/24.
//

import SwiftUI

struct GenreView : View {
    
    @State public var genres: [String]
    @Binding var selectedCategory: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 18){
                ForEach(genres, id: \.self) { genre in
                    genreButton(genre: genre)
                }
            }
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
}

#Preview {
    GenreView(genres: ["hi", "hihi", "hi", "hihi"], selectedCategory: .constant("hi"))
}
