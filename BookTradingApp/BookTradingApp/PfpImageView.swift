////
////  PfpImageView.swift
////  BookTradingApp
////
////  Created by Rex Peter on 11/29/24.
////
//
//import SwiftUI
//
//struct PfpImageView: View {
//    var body
//    
//    if let selectedImage = selectedImage {
//        Image(uiImage: selectedImage) // Display selected image
//            .resizable()
//            .frame(width: 150, height: 150)
//            .clipShape(Circle()) // Circular profile image
//            .overlay(Circle().stroke(Color.white, lineWidth: 4)) // Border
//            .shadow(radius: 10)
//    } else {
//        Image("profile")
//            .resizable()
//            .frame(width: 150, height: 150)
//            .position(x: geometry.size.width / 2, y: 0)
//    }
//}
