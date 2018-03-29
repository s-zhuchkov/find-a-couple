//
//  Card.swift
//  Concentration
//
//  Created by serg on 21/02/2018.
//  Copyright © 2018 serg. All rights reserved.
//

import Foundation

struct Card{
    
    var isFaseUp = false
    var isMatched = false
    var isChosen = false
    var identifier: Int
    
    init() {
        self.identifier = Card.getUniqId()
    }
    
    static var identifierFactory = 0
    static func getUniqId() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
