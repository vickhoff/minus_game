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

    
    private var dbUsers = Firestore.firestore().collection("users")
    
    init() {
        dbUsers.order(by: "score", descending: true).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            
            self.users = documents.map { queryDocumentSnapshot -> UserModel in
                let data = queryDocumentSnapshot.data()
                let userID = queryDocumentSnapshot.documentID
                let name = data["name"] as? String ?? ""
                let emoji = data["emoji"] as? String ?? ""
                let score = data["score"] as? Int ?? 0
                let joined = data["joined"] as? String ?? ""
                let highest = data["highest"] as? Int ?? 0
                let lowest = data["lowest"] as? Int ?? 0
                let avgPrWeek = data["avgPrWeek"] as? Double ?? 0
                let aboveZero = data["aboveZero"] as? Int ?? 0
                let belowZero = data["belowZero"] as? Int ?? 0

                return UserModel(id: .init(), userID: userID, name: name, emoji: emoji, score: score, joined: joined, highest: highest, lowest: lowest, avgPrWeek: avgPrWeek,aboveZero: aboveZero , belowZero: belowZero)
            }
        }
        
    }
    
    func givePlus(user: UserModel) {
        let userRef = dbUsers.document(user.userID)
        
        //Give Plus
        userRef.updateData([
            "score": user.score + 1
        ]) { err in
            if let err = err {
                print("Plus point given: \(err)")
            } else {
                print("Plus point succeeded")
            }
        }
        
        //Update Highest
        if user.highest == user.score {
            userRef.updateData([
                "highest": user.highest + 1
            ]) { err in
                if let err = err {
                    print("Lowest failed to update: \(err)")
                } else {
                    print("Lowest updated")
                }
            }
        }
    }
    
    //Give Minus
    func giveMinus(user: UserModel) {
        let userRef = dbUsers.document(user.userID)
        
        //Give minus
        userRef.updateData([
            "score": user.score - 1
        ]) { err in
            if let err = err {
                print("Minus point failed: \(err)")
            } else {
                print("Minus point succeeded")
            }
        }
        
        //Update Lowest
        if user.lowest == user.score {
            userRef.updateData([
                "lowest": user.lowest - 1
            ]) { err in
                if let err = err {
                    print("Lowest failed to update: \(err)")
                } else {
                    print("Lowest updated")
                }
            }
        }
    }
    
    //Add dymmy user
    func addUser() {
        
        var userRef: DocumentReference? = nil
        let startingScore: Int = 0
        userRef = dbUsers.addDocument(data: [
            "name": "David",
            "emoji": "🦁",
            "score": startingScore,
            "joined": "05/19",
            "highest": startingScore,
            "lowest": startingScore,
            "avgPrWeek": 0.5,
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(userRef!.documentID)")
            }
        }
        
    }
    
    //Delete user
    
    func deleteUser(user: UserModel) {
        dbUsers.document(user.userID).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    

}
