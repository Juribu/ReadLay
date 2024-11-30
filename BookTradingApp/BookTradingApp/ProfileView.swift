//
//  ProfileView.swift
//  BookTradingApp
//
//  Created by Rex Peter on 11/29/24.
//

import SwiftUI

let name = "Oshin"
let email = "omr6@cornell.edu"
let username = "o"

struct ProfileView: View {
    @State var selectedImage: UIImage?
    @State private var isImagePickerPresented = false

    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ZStack {
                    Color(red: 188/255, green: 184/255, blue: 138/255).edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Text("@" + String(username))
                            .position(x: geometry.size.width / 2, y: 100)
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                        
                        
                        ZStack {
                            if let selectedImage = selectedImage {
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    .shadow(radius: 10)
                            } else {
                                Image("profile")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            }
                            
                            Button(action: {
                                self.isImagePickerPresented = true
                            }) {
                                Image("EditButton")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .position(x: geometry.size.width - 160, y: 130)
                            }
                        }
                        
                        Spacer().frame(height: 20)
                        
                        VStack {
                            Text(name)
                                .font(.title)
                                .foregroundColor(.white)
                                .bold()
                            
                            Text(email)
                                .font(.body)
                                .foregroundColor(.white)
                                .bold()
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 10)
                    }
                    .padding(.bottom, 50)
                    
                    VStack {
                        Spacer().frame(height: 175)
                        Spacer()
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: self.$selectedImage)
            }
            
            HomeView(books: Book.DummyBooks.filter { $0.username == username })
        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }
    
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?  // Binding to update the selected image in the parent view
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator // Set the delegate
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No updates needed here for this example
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    // Coordinator class to handle image picker actions
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image // Set the selected image
            }
            picker.dismiss(animated: true, completion: nil) // Dismiss the picker
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil) // Dismiss the picker if canceled
        }
    }
}


#Preview {
    ProfileView()
}

//Image(systemName: "star.fill")  // Using SF Symbol
//    .resizable()                // Make the image resizable
//.frame(width: 100, height: 100)  // Set the desired width and height
//    .foregroundColor(.yellow)
