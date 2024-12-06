//
//  SetupAccountView.swift
//  BookTradingApp
//
//  Created by Oshin Rex on 12/5/24.
//

import SwiftUI

struct SetupAccountView: View {
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var retypedpassword = ""
    
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                Constants.Colors.scholarYellow.ignoresSafeArea()
                
                VStack {
                    VStack {
                        ZStack {
                            
                            if let selectedImage = selectedImage {
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 154, height: 154)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                            } else {
                                Ellipse()
                                    .frame(width: 154, height: 154)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onTapGesture {
                            isImagePickerPresented.toggle()
                        }
                        
                        Button(action: {
                            isImagePickerPresented.toggle()
                        }) {
                            Text("Change Image")
                                .foregroundStyle(.black)
                                .font(.subheadline)
                        }
                        .padding(.top, 10)
                    }
                    .padding(.bottom, 20)
                    
                    VStack(alignment: .leading) {
                        Text("Name")
                            .padding(.leading, 20)
                        HStack {
                            TextField("First name", text: $firstname)
                                .font(.subheadline)
                                .padding()
                                .background(Constants.Colors.scholarYellow)
                                .cornerRadius(8)
                                .shadow(radius: 2)
                                .padding(.horizontal)
                            
                            TextField("Last name", text: $lastname)
                                .font(.subheadline)
                                .padding()
                                .background(Constants.Colors.scholarYellow)
                                .cornerRadius(8)
                                .shadow(radius: 2)
                                .padding(.horizontal)
                        }
                        .padding(.bottom, 20)
                        
                        Text("Username")
                            .padding(.leading, 20)
                        TextField("Choose a username...", text: $username)
                            .font(.subheadline)
                            .padding()
                            .background(Constants.Colors.scholarYellow)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        
                        Text("Email Address")
                            .padding(.leading, 20)
                        TextField("Enter your email address...", text: $email)
                            .font(.subheadline)
                            .padding()
                            .background(Constants.Colors.scholarYellow)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        
                        Text("Password")
                            .padding(.leading, 20)
                        TextField("Choose a strong password", text: $password)
                            .font(.subheadline)
                            .padding()
                            .background(Constants.Colors.scholarYellow)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                    }
                        NavigationLink{
                            if true{
                               ContentView()
                                .navigationBarBackButtonHidden(true)
                            }
                        } label: {
                            Text("Create")
                        }
                
                        
                    }
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage)
                }
            }
        }
    }

#Preview {
    SetupAccountView()
}
