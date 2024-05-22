//
//  Message.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 22/5/24.
//

import Foundation

struct Message: Identifiable, Hashable, Codable {
    let fromId: String
    let toId: String
    let messageText: String
//    let timeStamp: Timestamp
    let isImage: Bool
    let isAudio: Bool
    let isVideo: Bool
    let user: User?
    var id = UUID().uuidString
}

struct MessageGroup: Identifiable, Hashable {
    var id = UUID().uuidString
    var message: [Message]
    let date: Date
}

extension MessageGroup {
    static let MOCK_MESSAGE_GROUP = [MessageGroup(
        message: [
            Message(fromId: "", toId: "", messageText: "Hello Mr Nhu", isImage: false, isAudio: false, isVideo: false, user: nil),
            Message(fromId: "", toId: "", messageText: "Hello Mr Nhu", isImage: false, isAudio: false, isVideo: false, user: nil),
            Message(fromId: "", toId: "", messageText: "Hello Mr Nhu", isImage: false, isAudio: false, isVideo: false, user: nil),
            Message(fromId: "", toId: "", messageText: "Hello Mr Nhu", isImage: false, isAudio: false, isVideo: false, user: nil)
        ],
        date: Date()
    )]
}
