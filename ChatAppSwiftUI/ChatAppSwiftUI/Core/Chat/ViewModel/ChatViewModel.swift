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
    @Published var chatPartner: User
    @Published var messageGroups = [MessageGroup]()
    
    init(chatPartner: User) {
        self.chatPartner = chatPartner
        observeMessages()
    }
    
    func sendMessage(chatPartner: User, isImage: Bool, isVideo: Bool, isAudio: Bool) {
        ChatService.sendMessage(messageText, chatPartner: chatPartner, isImage: isImage, isVideo: isVideo, isAudio: isAudio)
        messageText = ""
    }
    
    func observeMessages() {
        ChatService.observeMessages(chatPartner: chatPartner) { messages in
//            self.messageGroups.append(MessageGroup(message: messages, date: Date()))
            let groupedMessages = self.groupMessageByDate(messages: messages)
            for group in groupedMessages {
                if let groupDateIndex = self.messageGroups.firstIndex(where: { $0.date == group.date }) {
                    self.messageGroups[groupDateIndex].messages.append(contentsOf: group.messages)
                } else {
                    self.messageGroups.append(group)
                }
            }
        }
    }
    
    private func groupMessageByDate(messages: [Message]) -> [MessageGroup] {
        var groupedMessages = [Date: [Message]]()
        for message in messages {
            let messageDate = Calendar.current.startOfDay(for: message.timeStamp.dateValue())
            if groupedMessages[messageDate] == nil {
                groupedMessages[messageDate] = [message]
            } else {
                groupedMessages[messageDate]?.append(message)
            }
        }
        return groupedMessages.map { (date, messages) in
            MessageGroup(messages: messages, date: date)
        }
        .sorted { $0.date < $1.date }
    }
}
