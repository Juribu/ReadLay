//
//  BookItemView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/29/24.
//

import SwiftUI

struct BookItemView: View {
    
    let book: Book
    @State private var likes: [String] = UserDefaults.standard.array(forKey: "likes") as? [String] ?? []
    
    init(book: Book) {
        self.book = book
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                
//                Color(UIColor(red: 248/255, green: 241/255, blue: 229/255, alpha: 1.0)).ignoresSafeArea()
                Color(UIColor(.white))
                
                ScrollView{
                    VStack(alignment: .leading){
                        displayQuote
                            .padding(.bottom, 14)
                        
                        displayBookImage
                            .padding(.bottom, 24)
                        
                        HStack(alignment: .top){
                            displayTitleAndAuthor
                            
                            Spacer()
                            
                            NavigationLink{
                                ProfileView(who: false)
                            }label: {
                                displaySellerPfp
                            }
                        }
                        displayDescription
                    }
                    .padding(42)
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        toggleLike()
                        
                    } label:{
                        let imageString = likes.contains(book.id) ? "heart.fill" : "heart"
                        Image(systemName: imageString)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
    private func toggleLike() {
        if likes.contains(book.id){
            likes.removeAll { $0 == book.id }
        } else {
            likes.append(book.id)
        }
        
        UserDefaults.standard.setValue(likes, forKey: "likes")
    }
    
    private var displayQuote: some View {
        VStack (alignment: .center){
            Text("\"\(book.quote)\"")
                .italic()
                .multilineTextAlignment(.center)
                .font(.system(size: 10))
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private var displayBookImage: some View{
        Image(book.image)
            .resizable()
            .frame(width: 313, height: 467)
            .cornerRadius(8)
    }
    
    private var displayTitleAndAuthor: some View {
        VStack(alignment: .leading){
            Text(book.title)
                .font(.system(size: 24))
                .multilineTextAlignment(.leading)
                .bold()
            Text("Author: " + book.author)
                .font(.system(size: 8))
        }
    }
    
    private var displaySellerPfp: some View {
        Image("profile")
            .resizable()
            .frame(width: 50, height: 50)
    }
    
    private var displayDescription: some View {
        Text(book.description)
            .multilineTextAlignment(.leading)
            .font(.system(size: 12))
    }
    
    
}

#Preview {
    BookItemView(book: Book.DummyBooks[0])
}
