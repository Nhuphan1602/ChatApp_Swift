//
//  RegistrationViewModel.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 1/6/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var fullName: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
}

