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
                ZStack {
                    Color(red: 248/255, green: 241/255, blue: 229/255).ignoresSafeArea()
                    
                    VStack {
                        showUserHandler
                        
                        ZStack {
                            showtPfpImage()
                                .clipShape(Circle())
                                .shadow(radius: 10)
                            
                            Button{
                                self.isImagePickerPresented = true
                            } label: {
                                Image("EditButton")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            .offset(x: 55, y: 60)
                        }
                        
                        Spacer().frame(height: 20)
                        
                        showNameEmail
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 10)
                        
                        HomeView(books: Book.DummyBooks.filter { $0.username == username })
                    }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: self.$selectedImage)
            }
        }
    }
    
    private func showtPfpImage() -> some View {
        if let selectedImage = selectedImage {
            Image(uiImage: selectedImage)
                .resizable()
                .frame(width: 150, height: 150)
        } else {
            Image("profile")
                .frame(width: 150, height: 150)
        }
    }
    
    
    
    private var showUserHandler: some View {
        Text("@" + String(username))
            .foregroundColor(.black)
            .bold()
            .font(.title2)
    }
    
    private var showNameEmail: some View {
        VStack {
            Text(name)
                .font(.title)
                .foregroundColor(.black)
                .bold()
            
            Text(email)
                .font(.body)
                .foregroundColor(.black)
                .bold()
        }
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
