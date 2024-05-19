//
//  User.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 19/5/24.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    let fullName: String
    let email: String
    let phoneNumber: String
    var profileImageURL: String?
}

extension User {
    static let MOCK_USER = User(fullName: "Wanda Maximoff",
                                email: "wanda.maximoff@gmail.com",
                                phoneNumber: "01234567",
                                profileImageURL: "elizabeth")
}
