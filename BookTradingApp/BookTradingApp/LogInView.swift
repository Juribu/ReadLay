//
//  LogInView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 12/5/24.
//

import SwiftUI

struct LogInView: View {
    
//    @Binding var userDidLogin: Bool
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Text("Start reading with")
                    .multilineTextAlignment(.center)
                    .font(.title2)
                
                Text("ReadLay")
                    .multilineTextAlignment(.center)
                    .font(.title)
                
                Image("appIcon")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.horizontal, 180)
                
                NavigationLink{
                    HelloAgainView()
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
                
                NavigationLink{
                    SetupAccountView()
                } label: {
                    ZStack {
                        Text("Sign up")
                            .foregroundStyle(.black)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size:20))
                            .zIndex(1)
                        
                        RoundedRectangle(cornerRadius: 28)
                            .fill(Constants.Colors.signupButton)
                            .frame(width: 334, height: 56)
                    }
                }
                
                Spacer()
            }
            .background{
                Constants.Colors.scholarYellow.ignoresSafeArea()
            }
        }
    }
}

#Preview {
    LogInView()
}
