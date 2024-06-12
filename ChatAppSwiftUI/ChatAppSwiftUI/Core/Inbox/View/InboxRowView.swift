//
//  InboxRowView.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 19/5/24.
//

import SwiftUI

struct InboxRowView: View {
    private var width: CGFloat
    private var message: Message
    
    init(width: CGFloat, message: Message) {
        self.width = width
        self.message = message
    }
    
    var body: some View {
        HStack(spacing: 12) {
            CircularProfileImageView(size: .medium, user: message.user)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(message.user?.fullName ?? "")
                    .fontWeight(.semibold)
                if message.isImage {
                    Text("Sent a photo")
                        .foregroundStyle(.gray)
                        .lineLimit(2)
                        .frame(maxWidth: width - 100, alignment: .leading)
                } else if message.isVideo {
                    Text("Sent a video")
                        .foregroundStyle(.gray)
                        .lineLimit(2)
                        .frame(maxWidth: width - 100, alignment: .leading)
                } else {
                    Text(message.messageText)
                        .foregroundStyle(.gray)
                        .lineLimit(2)
                        .frame(maxWidth: width - 100, alignment: .leading)
                }
            }
            .font(.subheadline)
            
            HStack {
                Text(message.timeStamp.dateValue().timeStampString())
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }.frame(height: 72)
    }
}
