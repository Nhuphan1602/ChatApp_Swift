//
//  WelcomeView.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 1/6/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.darkGray))
                .padding()
                
                Image("welcome_image")
                    .resizable()
                    .frame(width: proxy.size.width - 80, height: proxy.size.width - 60)
                
                TitleView()
                
                LanguageView()
                
                Spacer()
                
                AgreeButton(width: proxy.size.width)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

#Preview {
    WelcomeView()
}

struct AgreeButton: View {
    private var width: CGFloat
    
    init(width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        Button  {
            
        } label: {
            Text("Agree and continue")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: width - 80, height: 44)
                .background(Color(.darkGray))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to WhatsApp")
                .font(.title2)
                .fontWeight(.semibold)
            Text("Read out")
                .foregroundStyle(.gray) +
            Text(" Privacy Policy")
                .foregroundStyle(.blue) +
            Text(". Tap agree and continue to accept the")
                .foregroundStyle(.gray) +
            Text(" Terms of service")
                .foregroundStyle(.blue)
        }
        .font(.subheadline)
        .padding(.horizontal)
        .padding(.top, 24)
    }
}

struct LanguageView: View {
    var body: some View {
        Capsule()
            .fill(Color(.systemGray5))
            .frame(width: 160, height: 40)
            .overlay {
                HStack {
                    Image(systemName: "network")
                    Spacer()
                    Text("English")
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .padding(.horizontal)
                .foregroundStyle(Color(.darkGray))
                .font(.subheadline)
            }
            .padding(.top, 14)
    }
}
