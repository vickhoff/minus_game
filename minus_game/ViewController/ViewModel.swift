//
//  Firebase.swift
//  minus_game
//
//  Created by David Vickhoff on 2021-02-04.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

let db = Firestore.firestore()

private func setDocument() {
    // [START set_document]
    // Add a new document in collection "cities"
    db.collection("users").document("alexandra").setData([
        "name": "Alexandra H",
        "emoji": "💥",
        "score": -121,
        "joined": "05/17",
    ]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
    // [END set_document]
}
