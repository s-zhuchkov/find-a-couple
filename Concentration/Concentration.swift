//
//  Concentration.swift
//  Concentration
//
//  Created by serg on 21/02/2018.
//  Copyright © 2018 serg. All rights reserved.
//

import Foundation

class Concetration{
    var cards = Array<Card>()
    
    var precedingCardAndFaceUpOnlyIdx: Int?
    var countOfMatch = 0
    var flipCount = 0
    var scoreAmount = 0
    
    func chooseCard(at index: Int){
        
        flipCount += 1
        
        if cards[index].isMatched == false {
            
            cards[index].isFaseUp = true
    
            if let matchCardIdx = precedingCardAndFaceUpOnlyIdx {
                
                if matchCardIdx != index, cards[matchCardIdx].identifier == cards[index].identifier {
                    cards[matchCardIdx].isMatched = true
                    cards[index].isMatched = true
                    countOfMatch += 1
                }
                
                calcScore(currentIdx: index, presedingIdx: matchCardIdx)
                
                precedingCardAndFaceUpOnlyIdx = nil
                
                // in the end of the game
                if countOfMatch == cards.count/2 {
                    cards[matchCardIdx].isFaseUp = false
                    cards[index].isFaseUp = false
                }
                
            // next step after match or new game
            } else {
                for faceUpCard in cards.indices{
                    if index != faceUpCard {
                        cards[faceUpCard].isFaseUp = false
                    }
                }
                precedingCardAndFaceUpOnlyIdx = index
            }
        }
    }
    
    func calcScore(currentIdx: Int, presedingIdx: Int) {
        
        if cards[currentIdx].isMatched && cards[presedingIdx].isMatched {
            scoreAmount += 2
        } else {
            scoreAmount -= cards[currentIdx].isChosen ? 1 : 0
            scoreAmount -= cards[presedingIdx].isChosen ? 1 : 0
        }
        
        cards[currentIdx].isChosen = true
        cards[presedingIdx].isChosen = true
    }
    
    init(numberOfPairstOfCads: Int) {
        
        var orderedList = Array<Card>()
        for _ in 1 ... numberOfPairstOfCads{
            let card = Card()
            //cards.append(contentsOf: [card, card])
            orderedList += [card, card]
        }
        
        for _ in orderedList.indices{
            let randomIdx = Int(arc4random_uniform(UInt32(orderedList.count)))
            cards += [orderedList.remove(at: randomIdx)]
        }
    }
    
}
