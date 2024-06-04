//
//  RootView.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 4/6/24.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var viewModel = RootViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                InboxView()
            } else {
                WelcomeView()
            }
        }
    }
}

#Preview {
    RootView()
}
