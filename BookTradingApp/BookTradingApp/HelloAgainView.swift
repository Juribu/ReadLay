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
    var body: some View{
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
            Spacer()
        }
        .background{
            Constants.Colors.scholarYellow.ignoresSafeArea()
        }
    }
}

#Preview {
    HelloAgainView()
}
