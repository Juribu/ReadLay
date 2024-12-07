//
//  Book.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/29/24.
//

import Foundation

struct Book: Codable, Hashable {
    let id: String
    let title: String
    let author: String
    let description: String
    let image: String
    let quote: String
    let genre: String
    let username: String
    
    
//    let time: Date
    
//    static func sortPostsByDate(_ posts: [Post], ascending: Bool = true) -> [Post] {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//
//        return posts.sorted {
//            guard let date1 = dateFormatter.date(from: $0.created),
//                  let date2 = dateFormatter.date(from: $1.created) else {
//                return ascending
//            }
//            return ascending ? date1 < date2 : date1 > date2
//        }
//    }
}

extension Book {
    static let DummyBooks = [
        Book(id: "1", title: "Harry Potter Harry Potter poter pot", author: "Jk rowling", description: "Harry potter is a boi, Harry potter is a boi, Harry potter is a boi, Harry potter is a boi, Harry potter is a boi, Harry potter is a boi, Harry potter is a boi, Harry potter is a boi, Harry potter is a boi, ", image: "harryPotter", quote: "alden, lden lden lden lden lden lden lden lden lden lden lden lden  lden", genre: "Fiction", username: "o"),
        Book(id: "2", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Romance", username: "o"),
        Book(id: "3", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Fiction", username: "o"),
        Book(id: "4", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Romance", username: "o"),
        Book(id: "5", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Fiction", username: "o"),
        Book(id: "6", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "", username: "o"),
        Book(id: "7", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Fantasy", username: "v"),
        Book(id: "8", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Mystery", username: "v")
    ]
}
