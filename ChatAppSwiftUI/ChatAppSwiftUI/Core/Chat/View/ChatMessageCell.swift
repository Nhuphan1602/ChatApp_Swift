//
//  ChatMessageCell.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 22/5/24.
//

import SwiftUI
import Kingfisher
import AVKit

struct ChatMessageCell: View {
    let isFromCurrentUser: Bool
    let message: Message
    
    var body: some View {
        if isFromCurrentUser {
            VStack(alignment: .leading, spacing: message.isImage || message.isVideo ? 0 : -15) {
                if message.isImage {
                    KFImage(URL(string: message.messageText))
                        .resizable()
                        .frame(width: 180, height: 100)
                        .scaledToFill()
                        .padding(.horizontal)
                        .padding(.top, 6)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
                } else if message.isVideo {
                    if let videoUrl = URL(string: message.messageText) {
                        VideoPlayer(player: AVPlayer(url: videoUrl))
                            .frame(width: 150, height: 150)
                            .padding(.horizontal)
                            .padding(.top, 6)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
                    }
                } else {
                    Text(message.messageText)
                }
                HStack {
                    if message.isImage {
                        Spacer()
                            .frame(width: 99)
                    } else if message.isVideo {
                        Spacer()
                            .frame(width: 148)
                    } else {
                        Text(message.messageText)
                            .foregroundColor(.clear)
                    }
                    Text(message.timeStamp.dateValue().timeString())
                        .foregroundStyle(.gray)
                        .font(.footnote)
                }
            }
            .font(.subheadline)
            .padding(message.isImage || message.isVideo ? 1 : 12)
            .background(Color("Peach"))
            .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal)
        } else {
            HStack(spacing: 8) {
                CircularProfileImageView(size: .xxsmall, user: User.MOCK_USER)
                VStack(alignment: .leading, spacing: message.isImage || message.isVideo ? 0 : -15) {
                        if !message.isImage {
                            KFImage(URL(string: message.messageText))
                                .resizable()
                                .frame(width: 180, height: 100)
                                .scaledToFill()
                                .padding(.horizontal)
                                .padding(.top, 6)
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
                        } else if message.isVideo {
                            if let videoUrl = URL(string: message.messageText) {
                                VideoPlayer(player: AVPlayer(url: videoUrl))
                                    .frame(width: 150, height: 150)
                                    .padding(.horizontal)
                                    .padding(.top, 6)
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
                            }
                        } else {
                            Text(message.messageText)
                        }
                        HStack {
                            if message.isImage {
                                Spacer()
                                    .frame(width: 99)
                            } else if message.isVideo {
                                Spacer()
                                    .frame(width: 148)
                            } else {
                                Text(message.messageText)
                                    .foregroundColor(.clear)
                            }
                            Text(message.timeStamp.dateValue().timeString())
                                .foregroundStyle(.gray)
                                .font(.footnote)
                                .padding(.trailing, message.isImage || message.isVideo ? 5 : 0)
                        }
                    }
                    .font(.subheadline)
                    .padding(message.isImage || message.isVideo ? 1 : 12)
                    .background(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ChatMessageCell(isFromCurrentUser: Bool.random(), message: MessageGroup.MOCK_MESSAGE_GROUP.first!.messages.first!)
}
