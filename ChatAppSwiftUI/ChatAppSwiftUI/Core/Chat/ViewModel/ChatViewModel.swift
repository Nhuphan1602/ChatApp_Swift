//
//  ChatViewModel.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 20/5/24.
//

import SwiftUI
import Combine
import PhotosUI

class ChatViewModel: ObservableObject {
    @Published var messageText: String = ""
    @Published var tabbarVisibility: Visibility = .hidden
    @Published var chatPartner: User
    @Published var messageGroups = [MessageGroup]()
    @Published var count: Int = 0
    @Published var showPhotoPicker: Bool = false
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { try await loadImage(withItem:selectedImage) }
        }
    }
    @Published var messageImage: Image = Image("")
    @Published var showVideoPicker: Bool = false
    @Published var selectedVideo: PhotosPickerItem? {
        didSet {
            Task { try await loadVideo() }
        }
    }
    private var service = ChatService()
    private var cancellables = Set<AnyCancellable>()
    
    init(chatPartner: User) {
        self.chatPartner = chatPartner
        observeMessages()
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        service.$count.sink { [weak self] count in
            self?.count = count
        }
        .store(in: &cancellables)
    }
    
    private func loadImage(withItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.messageImage = Image(uiImage: uiImage)
        try await updateMessageImage(withUIImage: uiImage)
    }
    
    private func loadVideo() async throws {
        guard let item = selectedVideo else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        try await updateMessageVideo(withData: data)
    }
    
    private func updateMessageImage(withUIImage uiImage: UIImage) async throws {
        guard let imageURL = try? await ImageUploader.uploadMessageImage(uiImage: uiImage) else { return }
        service.sendMessage(imageURL, chatPartner: chatPartner, isImage: true, isVideo: false, isAudio: false)
    }
    
    private func updateMessageVideo(withData data: Data) async throws {
        guard let videoUrl = try? await VideoUploader.uploadVideo(withData: data) else { return }
        service.sendMessage(videoUrl, chatPartner: chatPartner, isImage: false, isVideo: true, isAudio: false)
    }
    
    func sendMessage(chatPartner: User, isImage: Bool, isVideo: Bool, isAudio: Bool) {
        service.sendMessage(messageText, chatPartner: chatPartner, isImage: isImage, isVideo: isVideo, isAudio: isAudio)
        messageText = ""
    }
    
    func observeMessages() {
        service.observeMessages(chatPartner: chatPartner) { messages in
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
