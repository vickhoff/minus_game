//
//  ViewModel.swift
//  minus_game
//
//  Created by David Vickhoff on 2021-02-04.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

class UsersViewModel: ObservableObject {
    @Published var users = [UserModel]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.users = documents.map { queryDocumentSnapshot -> UserModel in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let emoji = data["emoji"] as? String ?? ""
                let score = data["score"] as? Int ?? 0
                let joined = data["joined"] as? String ?? ""
                
                return UserModel(id: .init(), name: name, emoji: emoji, score: score, joined: joined)
            }
        }
    }
    
    func givePlus(user: UserModel) {
        let userRef = db.collection("users").document(user.id)

        userRef.updateData([
            "score": user.score + 1
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    

}
