//
//  Users.swift
//  BookTradingApp
//
//  Created by Jidong Zheng on 12/6/24.
//

import Foundation

struct User: Codable, Hashable {
    let username: String
    let password: String
    let profilePhoto: String
    let location: String
    let email: String

}
