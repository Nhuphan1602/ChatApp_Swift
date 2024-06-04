//
//  RootViewModel.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 4/6/24.
//

import Foundation
import Firebase
import Combine

class RootViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
