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
    private var numOfMatchingCards = 0
    private var startDate: Date
    private var endDate: Date
    
    
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
            
            // check end of game
            if (numOfMatchingCards * 2) == cards.count {
                endDate = Date()
            }
        }
    }
    
    func calcScore(currentIdx: Int, presedingIdx: Int) {
        
        if cards[currentIdx].isMatched && cards[presedingIdx].isMatched {
            scoreAmount += 2
            numOfMatchingCards += 1
        } else {
            scoreAmount -= cards[currentIdx].isChosen ? 1 : 0
            scoreAmount -= cards[presedingIdx].isChosen ? 1 : 0
        }
        
        cards[currentIdx].isChosen = true
        cards[presedingIdx].isChosen = true
    }
    
    func getTimeScore() -> String? {
        let durationOfGame = endDate.timeIntervalSince(startDate)
        
        if durationOfGame > 0 && scoreAmount > 0{
            
            let goodTime = 70.0
            
            let bonus = (goodTime / durationOfGame) * Double(scoreAmount)
            
            return String(Int(bonus.rounded(.toNearestOrAwayFromZero)))
        }
        else{
            return nil
        }
    }
    
    init(numberOfPairstOfCads: Int) {
        
        let sysdate = Date()
        startDate = sysdate
        endDate = sysdate
        
        var orderedList = Array<Card>()
        for _ in 1 ... numberOfPairstOfCads{
            let card = Card()
            //cards.append(contentsOf: [card, card])
            orderedList += [card, card]
        }
        
        // shuffle all cards
        for _ in orderedList.indices{
            let randomIdx = Int(arc4random_uniform(UInt32(orderedList.count)))
            cards += [orderedList.remove(at: randomIdx)]
        }
    }
    
}
