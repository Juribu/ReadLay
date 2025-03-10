//
//  BookItemView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/29/24.
//

import SwiftUI

struct BookItemView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let book: Book
    @State private var likes: [Int] = []
    
    init(book: Book) {
        self.book = book
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Constants.Colors.scholarYellow.ignoresSafeArea()
//                Color(UIColor(.white))
                
                ScrollView{
                    VStack(alignment: .leading){
                        displayQuote
                            .padding(.bottom, 14)
                        
                        displayBookImage
                            .padding(.bottom, 16)
                        
                        HStack(alignment: .top){
                            displayTitleAndAuthor
                            
                            Spacer()
                            
                            NavigationLink{
                                ProfileView(who: false, navigate: true)
                            }label: {
                                displaySellerPfp
                            }
                             
                        }
                        displayDescription
                    }
                    .padding(42)
                }
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
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black)
                    }
                }
                
                
            }
            .navigationBarBackButtonHidden()
            .onAppear{
                likes = UserDefaults.standard.array(forKey: "likes") as? [Int] ?? []
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
                .padding(.bottom, 2)
            Text("Author: " + book.author)
                .font(.system(size: 8))
                .padding(.bottom, 8)
        }
    }
    
    private var displaySellerPfp: some View {
        Image("profile")
            .resizable()
            .frame(width: 50, height: 50)
    }
    
    private var displayDescription: some View {
        VStack(alignment: .leading){
            Text(book.description)
                .multilineTextAlignment(.leading)
                .font(.system(size: 12))
            
            Text(book.genre)
                .multilineTextAlignment(.leading)
                .font(.system(size: 12))
                .padding(.top, 16)
        }
    }
    
    
}

#Preview {
    BookItemView(book: Book.DummyBooks[0])
}
