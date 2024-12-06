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
                
                Spacer()
                
                
            }
        }
    }
}

#Preview {
    LogInView()
}
