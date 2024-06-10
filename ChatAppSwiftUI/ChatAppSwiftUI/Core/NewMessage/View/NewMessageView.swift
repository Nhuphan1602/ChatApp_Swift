//
//  NewMessageView.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 20/5/24.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = NewMessageViewModel()
    @Binding var selectedUser: User?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    ContactView(imageName: "person.2.circle.fill", title: "New group")
                    ContactView(imageName: "person.circle.fill", title: "New contact")
                    ContactView(imageName: "shared.with.you.circle.fill", title: "New community")
                }.padding(.top)
                
                Text("Contact on WhatsApp")
                    .foregroundColor(Color(.darkGray))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.footnote)
                    .fontWeight(.semibold)
                ForEach(viewModel.users) { user in
                    HStack {
                        CircularProfileImageView(size: .small, user: user)
                        VStack(alignment: .leading) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Hi there! I am using WhatsApp")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    .onTapGesture {
                        selectedUser = user
                        dismiss()
                    }
                }
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 16) {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "arrow.backward")
                        })
                        VStack(alignment: .leading) {
                            Text("Select contact")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("2 contacts")
                                .font(.caption2)
                        }
                    }.foregroundColor(.white)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 24) {
                        Image(systemName: "magnifyingglass")
                        Image(systemName: "ellipsis")
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    NewMessageView(selectedUser: .constant(User.MOCK_USER))
}
