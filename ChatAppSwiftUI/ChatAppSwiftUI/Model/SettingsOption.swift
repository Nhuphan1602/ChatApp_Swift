//
//  SettingsOption.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 31/5/24.
//

import SwiftUI

enum SettingsOption: Int, CaseIterable, Identifiable {
    case account
    case privacy
    case avatar
    case chats
    case notifications
    case storageAndData
    case appLanguage
    case help
    case inviteAFriend
    case logout
    
    var id: Int {
        return self.rawValue
    }
    
    var title: String {
        switch self {
        case .account:
            return "Account"
        case .privacy:
            return "Privacy"
        case .avatar:
            return "Avatar"
        case .chats:
            return "Chats"
        case .notifications:
            return "Notification"
        case .storageAndData:
            return "Storage and Data"
        case .appLanguage:
            return "App Language"
        case .help:
            return "Help"
        case .inviteAFriend:
            return "Invite a friend"
        case .logout:
            return "Logout"
        }
    }
    
    var subtitle: String {
        switch self {
        case .account:
            return "Security notifications, change number"
        case .privacy:
            return "Block contacts, disappearing meassages"
        case .avatar:
            return "create, edit profile photo"
        case .chats:
            return "Theme, Wallpaper, chat history"
        case .notifications:
            return "Message, group & call tones"
        case .storageAndData:
            return "Network usage and auto download"
        case .appLanguage:
            return "English (device's language)"
        case .help:
            return "Help center, contact us, privacy policy"
        case .inviteAFriend:
            return ""
        case .logout:
            return ""
        }
    }
    
    var imageName: String {
        switch self {
        case .account:
            return "key.fill"
        case .privacy:
            return "lock.fill"
        case .avatar:
            return "face.smiling.inverse"
        case .chats:
            return "text.bubble.fill"
        case .notifications:
            return "bell.fill"
        case .storageAndData:
            return "circle.dotted.circle.fill"
        case .appLanguage:
            return "map.circle.fill"
        case .help:
            return "questionmark.circle.fill"
        case .inviteAFriend:
            return "person.2.fill"
        case .logout:
            return "rectangle.portrait.and.arrow.right.fill"
        }
    }
}
