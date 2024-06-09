//
//  ProfileView.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 22/5/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = ProfileViewModel()
    var body: some View {
        VStack {
            Button {
                viewModel.showPhotoPicker.toggle()
            } label: {
                ZStack(alignment: .bottomTrailing) {
                    ZStack {
                        CircularProfileImageView(size: .xxlarge, user: User.MOCK_USER)
                        if let profileImage = viewModel.profileImage {
                            profileImage
                                .resizable()
                                .frame(width: 120, height: 120)
                                .scaledToFill()
                                .clipShape(Circle())
                        }
                    }
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color(.darkGray))
                        .overlay {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.white)
                        }
                }
                .padding(.vertical)
            }

            VStack(spacing: 32) {
                OptionView(imageName: "person.fill",
                           title: "Name",
                           subtitle: User.MOCK_USER.fullName,
                           isEditable: true,
                           secondSubtitle: "This is not your username or pin. This name will be visible on WhatsApp contact")
                OptionView(imageName: "exclamationmark.circle",
                           title: "About",
                           subtitle: "Hi There! I am using WhatsApp.",
                           isEditable: true,
                           secondSubtitle: "")
                OptionView(imageName: "phone.fill",
                           title: "Phone",
                           subtitle: User.MOCK_USER.phoneNumber)
            }
            Spacer()
        }
        .toolbar(viewModel.tabbarVisibility, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Button {
                        viewModel.tabbarVisibility = .visible
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                    }
                    Text("Profile")
                }
                .font(.title3)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
            }
        }
        .photosPicker(isPresented: $viewModel.showPhotoPicker, selection: $viewModel.selectedImage)
    }
}

#Preview {
    ProfileView()
}

struct OptionView: View {
    
    private var imageName: String
    private var title: String
    private var subtitle: String
    private var isEditable: Bool = false
    private var secondSubtitle: String = ""
    
    init(imageName: String, title: String, subtitle: String) {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
    }
    
    init(imageName: String, title: String, subtitle: String, isEditable: Bool, secondSubtitle: String) {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
        self.isEditable = isEditable
        self.secondSubtitle = secondSubtitle
    }
    
    var body: some View {
        HStack(alignment: secondSubtitle != "" ? .top : .center, spacing: 24) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 16, height: 16)
                .scaledToFill()
                .foregroundColor(.gray)
                .padding(.top)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.gray)
                Text(subtitle)
                    .font(.footnote)
                if secondSubtitle != "" {
                    Text(secondSubtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 1)
                    
                }
            }
            Spacer()
            if isEditable {
                Image(systemName: "pencil")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .scaledToFill()
                    .foregroundColor(.gray)
            }
        }
        .padding(.leading)
        .padding(.trailing, 16)
    }
}
