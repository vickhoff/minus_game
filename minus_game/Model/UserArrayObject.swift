//
//  UserArrayObject.swift
//  minus_game
//
//  Created by David Vickhoff on 2021-01-31.
//

import Foundation

class UserArrayObject: ObservableObject {
    @Published var dataArray = [UserModel]()
    
    init() {
        let users = [
            UserModel(
                name: "Ben",
                emoji: "🇺🇸",
                score: -43,
                joined: "06/17",
                meta: [MetaModel(
                    highest: 11,
                    lowest: -999,
                    avgPrWeek: -0.66,
                    aboveZero: 6,
                    belowZero: 452
                )]
            ),
            UserModel(
                name: "Alexandra H",
                emoji: "💥",
                score: -121,
                joined: "05/17",
                meta: [MetaModel(
                    highest: 18,
                    lowest: -455,
                    avgPrWeek: -0.1,
                    aboveZero: 7,
                    belowZero: 410
                )]
            ),
            UserModel(
                name: "Hein",
                emoji: "🇳🇴",
                score: -230,
                joined: "08/20",
                meta: [MetaModel(
                    highest: 5,
                    lowest: -120,
                    avgPrWeek: -0.43,
                    aboveZero: 3,
                    belowZero: 46
                )]
            ),
            UserModel(
                name: "Thea",
                emoji: "🐕",
                score: -251,
                joined: "08/17",
                meta: [MetaModel(
                    highest: 51,
                    lowest: -347,
                    avgPrWeek: -0.2,
                    aboveZero: 13,
                    belowZero: 477
                )]
            )
        ]
        
        self.dataArray.append(contentsOf: users)

    }
    
}
