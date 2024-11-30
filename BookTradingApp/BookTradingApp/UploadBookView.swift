//
//  UploadBookView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/30/24.
//

import SwiftUI

struct UploadBookView : View {
    
    var body: some View{
        
        NavigationStack{
            VStack{
                Image(systemName: "heart")
                Text("hi")
                
                
                
                
                
                
                
                
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Post")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    UploadBookView()
}
