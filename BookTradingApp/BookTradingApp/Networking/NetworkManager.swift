//
//  NetworkManager.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 12/6/24.
//

import Foundation
import Alamofire

class NetworkManager{
    static let shared = NetworkManager()
    
    let endpoint: String = "https://34.48.124.252"
    private init() {}
    
    func fetchAllBooks(completion: @escaping ([Book]) -> Void) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(endpoint + "/books/" , method: .get)
            .validate()
            .responseDecodable(of: [Book].self, decoder: decoder) { response in
                switch response.result {
                case .success(let books):
                    print("Successfully fetched:  \(books.count) posts")
                    completion(books)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func fetchUsersBooks(userID: Int, completion: @escaping ([Book]) -> Void) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(endpoint + "/user/\(userID)/books/" , method: .get)
            .validate()
            .responseDecodable(of: [Book].self, decoder: decoder) { response in
                switch response.result {
                case .success(let books):
                    print("Successfully fetched:  \(books.count) posts")
                    completion(books)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func fetchUsersBooks(completion: @escaping ([Book]) -> Void) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(endpoint + "/user/" , method: .get)
            .validate()
            .responseDecodable(of: [Book].self, decoder: decoder) { response in
                switch response.result {
                case .success(let books):
                    print("Successfully fetched:  \(books.count) posts")
                    completion(books)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
//    # Route 4: Display a specific user’s information
//    GET  http://34.48.124.252/user/\(user_id)/profile/
//    func fetchUsersBooks(completion: @escaping ([Book]) -> Void) {
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        
//        AF.request(endpoint + "/user/" , method: .get)
//            .validate()
//            .responseDecodable(of: [User].self, decoder: decoder) { response in
//                switch response.result {
//                case .success(let posts):
//                    print("Successfully fetched:  \(posts.count) posts")
//                    completion(posts)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//    }
    
//    # Route 5: Return all the kinds of genres available
//    GET  http://34.48.124.252/genres/
//
//    # Route 6: Return information on a specific book
//    book_id = <id of a specific book> (int)
//    GET  http://34.48.124.252/book/\(book_id)/
//
//    # Route 7: Return all the books for a specific genre
//    genre_name = <the name of a genre> (string)
//    GET  http://34.48.124.252/genre/\(genre_name)/books/"
//
//    # Route 8: Create a new user
//    POST  http://34.48.124.252/user/
//    Parameters
//    {
//    username : <“username”> (String) ,
//    password : <“password”> (String),
//    profile_photo : <“profile_photo”> (String),
//    location : <“location”> (String)
//    }
//
//    # Route 9: Create a new book
//    POST  http://34.48.124.252/book/\(user_id)/
//    Parameters
//    {
//     name : <“name”> (String),
//     description = <"description"> (String),
//     genre_name = <"name of genre"> (String),
//     photos = <“photos"> (String)
//    }
//
//    # Route 10: Edit an existing book
//    book_id = <id of a specific book> (int)
//    POST  http://34.48.124.252/book/\(book_id)/edit/
//    Parameters:
//    {
//     name : <“name”> (String),
//     description = <"description"> (String),
//     genre_name = <"name of genre"> (String),
//     photos = <“photos"> (String)
//    (not all parameters are necessary here, will only change the ones provided)
//    }
//
//    # Route 11: Like (bookmark) a book
//    book_id = <id of book being liked> (int)
//    POST  http://34.48.124.252/book/\(user_id)/\(book_id)/like/
//
//    # Route 12: Create genre
//    POST  http://34.48.124.252/genre/
//    Parameters:
//    {
//        genre: <“name of genre”> (String)
//    }
//
//    #Route 13: Delete user
//    DELETE  http://34.48.124.252/user/\(user_id)/
//
//    #Route 14: Delete book
//    book_id = <id of a specific book> (int)
//    DELETE  http://34.48.124.252/book/\(book_id)/
//
//    #Route 15: Delete genre
//    genre_name = <the name of a genre> (string)
//    DELETE http://34.48.124.252/genre/\(genre_name)/

}
