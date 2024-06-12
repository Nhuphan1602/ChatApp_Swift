//
//  ImageUploader.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 8/6/24.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    
    static func uploadProfileImage(uiImage: UIImage) async throws -> String? {
        guard let imageData = uiImage.jpegData(compressionQuality: 0.25) else { return nil }
        let storageRef = Storage.storage().reference(withPath: "/profile_image/\(UUID().uuidString)")
        do {
            _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("Failed to upload image\(error.localizedDescription)")
            return nil
        }
    }
    
    static func uploadMessageImage(uiImage: UIImage) async throws -> String? {
        guard let imageData = uiImage.jpegData(compressionQuality: 0.25) else { return nil }
        let storageRef = Storage.storage().reference(withPath: "/message_image/\(UUID().uuidString)")
        do {
            _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("Failed to upload image\(error.localizedDescription)")
            return nil
        }
    }
}
