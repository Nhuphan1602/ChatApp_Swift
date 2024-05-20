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
}
