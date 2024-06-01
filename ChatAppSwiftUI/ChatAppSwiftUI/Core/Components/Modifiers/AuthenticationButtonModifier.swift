//
//  authenticationButton.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 1/6/24.
//

import SwiftUI

struct AuthenticationButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 360, height: 44)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func authenticationButtonModifier() -> some View {
        return modifier(AuthenticationButtonModifier())
    }
}
