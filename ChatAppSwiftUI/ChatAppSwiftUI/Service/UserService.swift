//
//  UserService.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 4/6/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    
    static var shared = UserService()
    
    @Published var currentUser: User?
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            currentUser = try snapshot.data(as: User.self)
        } catch {
            print("Failed to fetch user data \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> ()) {
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
        }
    }
    
    @MainActor
    func updateUserProfileImage(withImageURL imageURL: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(uid).updateData(["profileImageURL": imageURL])
        self.currentUser?.profileImageURL = imageURL
    }
}
