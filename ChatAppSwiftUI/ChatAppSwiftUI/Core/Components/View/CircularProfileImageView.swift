//
//  CircularProfileImageView.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 19/5/24.
//

import SwiftUI

enum ProfileImageSize {
    case xxsmall
    case xsmall
    case small
    case medium
    case large
    case xlarge
    case xxlarge
    
    var dimension: CGFloat {
        switch self {
        case .xxsmall:
            return 28
        case .xsmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .xlarge:
            return 80
        case .xxlarge:
            return 120
        }
    }
}

struct CircularProfileImageView: View {
    private let size: ProfileImageSize
    var user: User?
    
    init(size: ProfileImageSize, user: User?) {
        self.size = size
        self.user = user
    }
    
    var body: some View {
        if let profileImageURL = user?.profileImageURL {
            Image(profileImageURL)
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .scaledToFill()
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileImageView(size: .medium, user: nil)
}
