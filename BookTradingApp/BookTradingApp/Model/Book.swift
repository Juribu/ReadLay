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
//    let time: Date
}

extension Book {
    static let DummyBooks = [
        Book(id: "1", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "aldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenaldenalden", genre: "Fiction"),
        Book(id: "12", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "a Fiction"),
        Book(id: "1", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Fiction"),
        Book(id: "12", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "a Fiction"),
        Book(id: "1", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Fiction"),
        Book(id: "12", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "ab Fiction"),
        Book(id: "1", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Fiction"),
        Book(id: "12", title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "a Fiction")
    ]
}
