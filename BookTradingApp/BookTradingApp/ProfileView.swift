//
//  ProfileView.swift
//  BookTradingApp
//
//  Created by Oshin Rex on 11/29/24.
//

import SwiftUI

let name = "Oshin"
let email = "omr6@cornell.edu"
let username = "o"

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    
    @State private var navigate: Bool
    
    let who: Bool
    
    init(who: Bool, navigate: Bool){
        self.who = who
        self.navigate = navigate
    }

    var body: some View {
        NavigationStack{
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
                
                
                HStack{
                    
                    NavigationLink{
                        UploadBookView()
                    } label: {
                        Image(systemName: "plus")
                            .padding(.leading, 46)
                            .foregroundColor(.black)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    
                    showNameEmail
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 10)
                        .offset(x: -43)
                    
                    
                }
                
                HomeView(books: Book.DummyBooks.filter { $0.username == username }, home: false)
                    .background(ignoresSafeAreaEdges: .horizontal)
            }
            .background{
                Color(red: 248/255, green: 241/255, blue: 229/255).ignoresSafeArea()
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: self.$selectedImage)
        }
        .toolbar{
            if navigate{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black)
                    }
                }
    
            }
        }
        .navigationBarBackButtonHidden()
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
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}


#Preview {
    ProfileView(who: true, navigate: false)
}

//Image(systemName: "star.fill")  // Using SF Symbol
//    .resizable()                // Make the image resizable
//.frame(width: 100, height: 100)  // Set the desired width and height
//    .foregroundColor(.yellow)
