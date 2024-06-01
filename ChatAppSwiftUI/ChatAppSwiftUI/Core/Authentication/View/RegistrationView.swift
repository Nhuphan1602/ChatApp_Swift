//
//  RegistrationView.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 1/6/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            LogoImageView()
            FloatingField(title: "Email", placeholder: "", text: $viewModel.email)
            FloatingField(title: "Full name", placeholder: "", text: $viewModel.fullName)
            FloatingField(title: "Phone number", placeholder: "", text: $viewModel.phoneNumber)
            FloatingField(title: "Password", placeholder: "", text: $viewModel.password)
            Button(action: {
                
            }, label: {
                Text("Sign up")
                    .authenticationButtonModifier()
            })
            .padding(.vertical)
            
            Spacer()
            Divider()
            NavigationLink {
                LoginView()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundStyle(.gray)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    RegistrationView()
}
