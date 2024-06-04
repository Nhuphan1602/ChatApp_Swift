//
//  AuthService.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 4/6/24.
//

import Foundation
import Firebase
import FirebaseFirestore

class AuthService {
    
    static var shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func createUser(email: String, password: String, fullName: String, phoneNumber: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
        try await uploadData(email: email, fullName: fullName, phoneNumber: phoneNumber, id: result.user.uid)
    }
    
    private func uploadData(email: String, fullName: String, phoneNumber: String, id: String) async throws {
        let user = User(id: id, fullName: fullName, email: email, phoneNumber: phoneNumber)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("Failed to login \(error.localizedDescription)")
        }
    }
    
    private func loadUserData() {
        Task { try await UserService.shared.fetchCurrentUser() }
    }
    
    func logout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.currentUser = nil
    }
}
