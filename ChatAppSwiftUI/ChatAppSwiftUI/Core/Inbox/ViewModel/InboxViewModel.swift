//
//  InboxViewModel.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 20/5/24.
//

import Foundation
import Combine

class InboxViewModel: ObservableObject {
    @Published var showNewMessage: Bool = false
    @Published var currentUser: User?
    @Published var showChat: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscriptions()
    }
    
    private func setupSubscriptions() {
        UserService.shared.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
