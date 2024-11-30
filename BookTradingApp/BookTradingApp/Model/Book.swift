//
//  Book.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/29/24.
//

import Foundation

struct Book: Hashable {
    let id: String
    let title: String
    let author: String
    let description: String
    let image: String
    let quote: String
    let genre: String
    let username: String
    
//    let time: Date
}

extension Book {
    static let DummyBooks = [
        Book(id: "1", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Fiction", username: "o"),
        Book(id: "2", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "a Fiction", username: "o"),
        Book(id: "3", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Fiction", username: "o"),
        Book(id: "4", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "a Fiction", username: "o"),
        Book(id: "5", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Fiction", username: "o"),
        Book(id: "6", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "ab Fiction", username: "o"),
        Book(id: "7", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Fiction", username: "v"),
        Book(id: "8", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "a Fiction", username: "v")
    ]
}
