//
//  UserModel.swift
//  Minusgame
//
//  Created by David Vickhoff on 2021-01-14.
//

import SwiftUI

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let emoji: String
    let score: Int
    let joined: String
}
