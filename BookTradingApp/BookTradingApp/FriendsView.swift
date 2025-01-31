//
//  FriendsView.swift
//  BookTradingApp
//
//  Created by Oshin Rex on 12/6/24.
//

import SwiftUI

// Define a struct to hold the friend's information
struct Friend {
    var book1: String
    var book2: String
    var username: String
    var email: String
}

struct FriendsView: View {
    // Sample dictionary for friends (replace with actual data source)
    let friends: [String: Friend] = [
        "John" : Friend(book1: "catcherRye", book2: "wilderGirls", username: "JohnDoe", email: "johndoe@gmail.com"),
        "bon" : Friend(book1: "harryPotter", book2: "theGreatGatsby", username: "JohnDoe", email: "johndoe@gmail.com")
    ]
    
    let gridItems = [GridItem(.flexible())]

    var body: some View {
        ZStack {
            Constants.Colors.scholarYellow.ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(friends.keys.sorted(), id: \.self) { friendName in
                        let friend = friends[friendName]!
                        
                        VStack {
                           
                            HStack {
                                Image(friend.book1)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 111)
                                Image("swap")
                                Image(friend.book2)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 111)
                                VStack{
                                    Text("@" + friend.username)
                                        .font(.title3)
                                        .bold()
                                    Text(friend.email)
                                        .font(.system(size: 12))
                                }
                                    
                                
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview{
    FriendsView()
}
