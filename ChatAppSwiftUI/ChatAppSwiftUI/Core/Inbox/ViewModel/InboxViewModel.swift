//
//  InboxViewModel.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 20/5/24.
//

import Foundation
import Combine
import Firebase

class InboxViewModel: ObservableObject {
    @Published var showNewMessage: Bool = false
    @Published var currentUser: User?
    @Published var showChat: Bool = false
    @Published var latestMessages = [Message]()
    private var cancellables = Set<AnyCancellable>()
    private var inboxService = InboxService()
    
    init() {
        setupSubscriptions()
        inboxService.observeLatestMessage()
    }
    
    private func setupSubscriptions() {
        UserService.shared.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
        inboxService.$documentChanges.sink { [weak self] changes in
            self?.loadInitialMessage(withChanges: changes)
        }
        .store(in: &cancellables)
    }
    
    private func loadInitialMessage(withChanges changes: [DocumentChange]) {
        var messages = changes.compactMap({ try? $0.document.data(as: Message.self) })
        for i in 0 ..< messages.count {
            UserService.shared.fetchUser(withUid: messages[i].chatPartnerId) { user in
                messages[i].user = user
                if let userIndexInLatestMessages = self.latestMessages.lastIndex(where: {$0.user == messages[i].user}) {
                    self.latestMessages.remove(at: userIndexInLatestMessages)
                }
                self.latestMessages.insert(messages[i], at: 0)
            }
        }
    }
}
