import SwiftUI

struct BookshelfView: View {
    let books: [Book]
    
    init(books: [Book]) {
        self.books = books
    }
    
    private var numberOfRows: Int {
        return (books.count + 2) / 3
    }
    
    var body: some View {
            NavigationView{
                ZStack{
//                    Color(UIColor(red: 248/255, green: 241/255, blue: 229/255, alpha: 1.0)).ignoresSafeArea()
                    Color(.white).ignoresSafeArea()
                    VStack {
                        GeometryReader { geometry in
                            VStack {
                                ForEach(0..<numberOfRows, id: \.self) { row in
                                    VStack {
                                        Color(.white).ignoresSafeArea()
//                                        Color(UIColor(red: 248/255, green: 241/255, blue: 229/255, alpha: 1.0)).ignoresSafeArea()
                                        
                                        HStack(spacing: 20) {
                                            
                                            ForEach(0..<3) { index in
                                                let bookIndex = row * 3 + index
                                                if bookIndex < books.count {
                                                    bookInfoRow(book: books[bookIndex], geometry: geometry)
                                                }
                                            }
                                        }
                                        .padding(.bottom, 10)
                                        if row != numberOfRows {
                                            Rectangle()
                                                .fill(Color.brown.opacity(1))
                                                .frame(height: 15)
                                        }
                                    }
                                }
                            }
                        }
                    }
            }
            
        }
    }
    
    private func bookInfoRow(book: Book, geometry: GeometryProxy) -> some View {
            VStack {
                NavigationLink(destination: BookItemView(book: book)) {
                    Image(book.image)
                        .resizable()
                }
            }
            .frame(width: geometry.size.width / 3 - 20, height: 170)
            .background(Color.white)
            .cornerRadius(8)
    }
}

#Preview {
    BookshelfView(books: Book.DummyBooks)
}
