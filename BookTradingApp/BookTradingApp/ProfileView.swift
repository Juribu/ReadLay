//
//  ProfileView.swift
//  BookTradingApp
//
//  Created by Rex Peter on 11/29/24.
//

import SwiftUI

let name = "Oshin"
let email = "omr6@cornell.edu"
<<<<<<< Updated upstream

let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8"]

let columns = [
    GridItem(.flexible()) // Flexible row height
]
=======
let username = "o"
>>>>>>> Stashed changes

struct ProfileView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color(.blue).edgesIgnoringSafeArea(.all)
                VStack{
                    Text(String("@" + String(username)))
                        .position(x: geometry.size.width / 2, y: 100)
                    ZStack{
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage) // Display selected image
                                .resizable()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle()) // Circular profile image
                                .overlay(Circle().stroke(Color.white, lineWidth: 4)) // Border
                                .shadow(radius: 10)
                        } else {
                            Image("profile")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .position(x: geometry.size.width / 2, y: 0)
                        }
                        
                        Button(action: {
                            self.isImagePickerPresented = true
                        }) {
                            Image("EditButton")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .position(x: 240, y: 45)
                        }
                    }
                    Text(name)
                        .font(.title2)
                    Text(email)
                        .font(.body)
                }
                .padding(.bottom, 50)
                
            }
        }.edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(selectedImage: self.$selectedImage)
                    }
        
//        HomeView(Book.DummyBooks.filter { $0.username == username })
    List(Book.DummyBooks.filter { $0.username == username }, id: \.self) { book in bookInfoRow(book)
        }
    }
    
    private func bookInfoRow(_ book: Book) -> some View {
        VStack{
            
            HStack {
                Image(book.image)
                    .resizable()
                    .frame(width: 100, height: 150)
                
                VStack(alignment: .leading){
                    Text(book.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(book.author)
                        .font(.subheadline)
                    
                    Text(book.description)
                        .font(.footnote)
                    
                    Text(book.genre)
                        .font(.custom("SFUIText", fixedSize: 10))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        
    }
    
    //private func
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
