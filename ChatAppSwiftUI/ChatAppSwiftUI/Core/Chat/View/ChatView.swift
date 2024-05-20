//
//  ChatView.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 20/5/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            ScrollView {
                
            }
            
            Spacer()
            
            HStack {
                ZStack {
                    TextField("Message...", text: $viewModel.messageText)
                        .padding(.vertical, 12)
                        .padding(.leading, 44)
                        .padding(.trailing, 60)
                        .background(Color(.systemGroupedBackground))
                        .clipShape(Capsule())
                    HStack {
                        Image(systemName: "face.smiling")
                        Spacer()
                        Image(systemName: "paperclip")
                        Image(systemName: "camera.fill")
                    }
                    .padding(.horizontal)
                    .foregroundColor(.gray)
                }
                Button(action: {
                    
                }, label: {
                    Image(systemName: viewModel.messageText == "" ? "mic.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(.darkGray))
                })
            }
            .padding()
        }
        .background{
            Image("background_image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(viewModel.tabbarVisibility, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Button(action: {
                        viewModel.tabbarVisibility = .visible
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward")
                    })
                    CircularProfileImageView(size: .xsmall, user: User.MOCK_USER)
                    Text(User.MOCK_USER.fullName)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
            }
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 24) {
                    Image(systemName: "video.fill")
                    Image(systemName: "phone.fill")
                    Image(systemName: "ellipsis")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ChatView()
}
