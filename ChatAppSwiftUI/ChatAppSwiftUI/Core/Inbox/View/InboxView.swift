//
//  InboxView.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 19/5/24.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ZStack(alignment: .bottomTrailing) {
                    List {
                        ForEach(0 ..< 5) { _ in
                            InboxRowView(width: proxy.size.width)
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                    Button(action: {}, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.darkGray))
                            .frame(width: 50, height: 50)
                            .padding()
                            .overlay{
                                Image(systemName: "plus.bubble.fill")
                                    .foregroundColor(.white)
                            }
                    })
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("WhatsApp")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .navigationBarColor(backgroundColor: Color(.darkGray))
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: 24) {
                            Image(systemName: "camera")
                            Image(systemName: "magnifyingglass")
                            Image(systemName: "ellipsis")
                        }
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
