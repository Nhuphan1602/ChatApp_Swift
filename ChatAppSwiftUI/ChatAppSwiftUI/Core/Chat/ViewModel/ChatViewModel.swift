//
//  ChatViewModel.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 20/5/24.
//

import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var messageText: String = ""
    @Published var tabbarVisibility: Visibility = .hidden
    
    func sendMessage(chatPartner: User, isImage: Bool, isVideo: Bool, isAudio: Bool) {
        ChatService.sendMessage(messageText, chatPartner: chatPartner, isImage: isImage, isVideo: isVideo, isAudio: isAudio)
        messageText = ""
    }
}
