//
//  UploadBookView.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/30/24.
//

import SwiftUI
import UIKit

struct UploadBookView: View {
    @State private var bookTitle = ""
    @State private var author = ""
    @State private var description = ""
    @State private var quote = ""
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .padding(.horizontal)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .clipped()

                    } else {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color(red: 0.8, green: 0.8, blue: 0.8))
                            .padding(.horizontal)
                    }
                    Button {
                        isImagePickerPresented = true
                    } label: {
                        Text("Upload Book Photo")
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                            .foregroundColor(.black)
                    }
                }
                
                TextField("Add Book Title", text: $bookTitle)
                    .font(.largeTitle)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                
                TextField("Add Author", text: $author)
                    .font(.subheadline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $description)
                        .font(.subheadline)
                        .frame(height: 70)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                        .padding(.horizontal)
                    
                    if description.isEmpty {
                        Text("Write a description about the book")
                            .foregroundColor(.gray)
                            .padding(.top, 9)
                            .padding(.leading, 30)
                            .font(.subheadline)
                    }
                }
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $quote)
                        .font(.subheadline)
                        .frame(height: 70)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                        .padding(.horizontal)
                    
                    if quote.isEmpty {
                        Text("What's your favorite quote?")
                            .foregroundColor(.gray)
                            .padding(.top, 9)
                            .padding(.leading, 30)
                            .font(.subheadline)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Post")
                        .foregroundColor(.black)
                }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: self.$selectedImage)
            }
        }
    }
}

#Preview {
    UploadBookView()
}
