//
//  SettingsView.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 31/5/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = SettingsViewModel()
    var body: some View {
        ScrollView {
            VStack {
                NavigationLink {
                    ProfileView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 12) {
                        CircularProfileImageView(size: .large, user: User.MOCK_USER)
                        VStack(alignment: .leading) {
                            Text(User.MOCK_USER.fullName)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                            Text("Hey there! I'm using WhatsApp")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                    .padding(.top)
                }
                
                Divider()
                    .padding(.vertical)
                
                VStack(spacing: 32) {
                    ForEach(SettingsOption.allCases) { option in
                        HStack(spacing: 24) {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundStyle(.gray)
                            VStack(alignment: .leading) {
                                Text(option.title)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                if option.subtitle != "" {
                                    Text(option.subtitle)
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }
            .padding(.horizontal)
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
                        Text("Settings")
                    }
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
