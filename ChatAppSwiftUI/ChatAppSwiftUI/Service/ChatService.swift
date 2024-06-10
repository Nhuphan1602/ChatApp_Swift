//
//  ChatService.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 10/6/24.
//

import Foundation
import Firebase

class ChatService {
    static func sendMessage(_ messageText: String, chatPartner: User, isImage: Bool, isVideo: Bool, isAudio: Bool) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = chatPartner.id
        let currentUserRef = Firestore.firestore().collection("messages").document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = Firestore.firestore().collection("messages").document(chatPartnerId).collection(currentUid)
        let documentId = currentUserRef.documentID
        let message = Message(fromId: currentUid,
                              toId: chatPartnerId,
                              messageText: messageText,
                              timeStamp: Timestamp(),
                              isImage: isImage,
                              isAudio: isAudio,
                              isVideo: isVideo,
                              user: nil)
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        currentUserRef.setData(messageData)
        chatPartnerRef.document(documentId).setData(messageData)
    }
}
