//
//  Book.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 11/29/24.
//

import Foundation

struct Book: Codable, Hashable {
    let id: Int
    let title: String
    let author: String
    let description: String
    let image: String
    let quote: String
    let genre: String
    let usernameID: Int
    
    
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
        Book(id: 1, title: "The Catcher in the Rye", author: "J. D. Salinger", description: "Holden Caulfield gets expelled from prep school, now he wanders NYC, grappling with the adult world.", image: "catcherRye", quote: "I’m just going through a phase right now. Everybody goes through phases and all, don’t they?", genre: "Realistic fiction", usernameID: 1),
        Book(id: 2, title: "Lessons in Chemistry", author: "Bonnie Garmus", description: "Elizabeth Zott becomes a cooking show host after being fired from her past chemistry job because of sexism. She uses this show to educate housewives about science.", image: "lessons", quote: "Your days are numbered. Use them to throw open the windows of your soul to the sun", genre: "Romance", usernameID: 1),
        Book(id: 3, title: "Wilder Girls", author: "Rory Power", description: "An All girls boarding school has been affected by a mysterious disease that kills the girls or morphes their bodies", image: "wilderGirls", quote: "We don't get to choose what hurts us", genre: "Sci-fi", usernameID: 12),
        Book(id: 4, title: "Gone with the Wind", author: "Margaret Mitchell", description: "Scarlett O’Hara struggles to rebuild her life after the American Civil War and losing her plantation and wealth", image: "goneWithTheWind", quote: "Hardships make or break people.", genre: "History", usernameID: 1),
        Book(id: 5, title: "A Court of Thorns and Roses", author: "Sarah J. Maas", description: "Feyre kills a wolf in the woods but a creature comes to demand retribution. Feyre discovers who this creature really is", image: "courtThornsRoses", quote: "Don't feel bad for one moment about doing what brings you joy", genre: "Fantasy", usernameID: 12),
        Book(id: 6, title: "Great Gatsby", author: "F. Scott Fitzgerald", description: "a self made millionaire pursues Daisy Buchanan, someone he loved in his youth. Will he end up with her?", image: "theGreatGatsby", quote: "I hope she'll be a fool -- that's the best thing a girl can be in this world, a beautiful little fool.", genre: "Mystery", usernameID: 12),
        Book(id: 7, title: "The Silent Patient ", author: "Alex Michaelides", description: "The Silent Patient", image: "theSilentPatient", quote: "Remember, love that doesn't include honesty doesn't deserve to be called love.", genre: "Romance", usernameID: 12),
        Book(id: 8, title: "HarryPotter", author: "Jk rowling", description: "good book!", image: "harryPotter", quote: "alden", genre: "Mystery", usernameID: 12)
    ]
}
