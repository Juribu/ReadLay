//
//  SetupAccountView.swift
//  BookTradingApp
//
//  Created by Rex Peter on 12/5/24.
//

import SwiftUI

struct SetupAccountView: View{
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var username = ""

    @State private var email = ""
    @State private var password = ""
    @State private var retypedpassword = ""

    var body: some View {
        VStack{
            Ellipse()
                .frame(width: 154, height: 154)
                .foregroundColor(.gray)
            Button(action: {
//                changeImage()
            }) {
                Text("change image")
                    .foregroundStyle(.black)
            }
        }
        
        
        VStack(alignment: .leading){
            Text("Name")
                .padding(.leading, 20)
            HStack{
                TextField("First name", text: $firstname)
                    .font(.subheadline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                TextField("Last name", text: $firstname)
                    .font(.subheadline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    .padding(.horizontal)
            }.padding(.bottom, 20)
            Text("Username")
                .padding(.leading, 20)

            TextField("Choose a username...", text: $username)
                .font(.subheadline)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 2)
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            Text("Email Address")
                .padding(.leading, 20)
            TextField("Enter your email address...", text: $email)
                .font(.subheadline)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 2)
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            Text("Password")
                .padding(.leading, 20)

            TextField("Choose a strong password", text: $password)
                .font(.subheadline)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 2)
                .padding(.horizontal)
                .padding(.bottom, 20)
          
        }
    }
}


#Preview{
    SetupAccountView()
}
