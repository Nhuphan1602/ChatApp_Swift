//
//  VideoUploader.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 12/6/24.
//

import Foundation
import FirebaseStorage

struct VideoUploader {
    
    static func uploadVideo(withData data: Data) async throws -> String? {
        let ref = Storage.storage().reference().child("/message_video/\(UUID().uuidString)")
        let metadata = StorageMetadata()
        metadata.contentType = "video/quickTime"
        do {
            let _ = try await ref.putDataAsync(data, metadata: metadata)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("Failed to upload video \(error.localizedDescription)")
            return nil
        }
    }
}
