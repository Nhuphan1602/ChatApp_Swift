//
//  ContactView.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 20/5/24.
//

import SwiftUI

struct ContactView: View {
    private var imageName: String
    private var title: String
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}
