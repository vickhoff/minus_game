//
//  UserModel.swift
//  Minusgame
//
//  Created by David Vickhoff on 2021-01-14.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

struct UserModel: Codable, Hashable {
    @DocumentID var id: String? =  UUID().uuidString
    //var userID: String
    var name: String
    var emoji: String
    var score: Int
    var joined: String
    //var meta: MetaModel

}

struct MetaModel: Codable, Hashable {
    var id: String
    var metaID: String
    var highest: Int
    var lowest: Int
    var avgPrWeek: Double
    var aboveZero: Int?
    var belowZero: Int?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
