//
//  HelloAgainView.swift
//  BookTradingApp
//
//  Created by Oshin Rex on 12/5/24.
//

import SwiftUI


struct HelloAgainView: View {
    @State private var entered_email = ""
    @State private var entered_password = ""
    @State private var correct_email = "jz2384@cornell.edu"
    @State private var correct_password = "jay"
    
//    @Binding private var userDidLogIn: Bool
    
    var body: some View{
        NavigationStack{
            VStack{
                Spacer()
                Text("Hello Again!")
                    .foregroundColor(.black)
                    .padding(.top, 9)
                    .padding(.horizontal, 50)
                    .font(.largeTitle)
                
                Image("appIcon")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.horizontal, 50)
                    .padding(.bottom, 66)
                
                TextField("email", text: $entered_email)
                    .font(.subheadline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                    .padding(.bottom, 14)
                
                TextField("password", text: $entered_password)
                    .font(.subheadline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                
                NavigationLink{
                    ContentView()
                } label: {
                    ZStack {
                        Text("Log In")
                            .foregroundStyle(.black)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size:20))
                            .zIndex(1)
                        RoundedRectangle(cornerRadius: 28)
                            .fill(Constants.Colors.loginButton)
                            .frame(width: 334, height: 56)
                    }
                }
            }
            .background{
                Constants.Colors.scholarYellow.ignoresSafeArea()
                
            }
            
        }
        .navigationBarBackButtonHidden()
    }
    
}
