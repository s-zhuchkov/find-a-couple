//
//  Emoji.swift
//  Concentration
//
//  Created by serg on 11/03/2018.
//  Copyright © 2018 serg. All rights reserved.
//

import Foundation

class Emoji {
    
    var numberOfPairstOfCads: Int
    
    //let nameOfTheme: String
    
    var emojiThemeList = ["smileys":   ["😈","👹","😇","😂","😨","😱","👻","🤥","😬","🤢","🤧","💀","☠️","🤖","🎃"],
                          "animals":   ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐷","🐥","🦆","🦉"],
                          "plants":    ["🌵","🎄","🌲","🌳","🌴","🌱","🍀","🎋","🍂","🍄","💐","🌹","🌻","🌼","🌸"],
                          "fruits":    ["🍏","🍎","🍐","🍊","🍆","🥒","🌽","🥝","🍌","🍉","🍇","🍟","🌰","🍒","🍓"],
                          "coffee":    ["🍭","🍬","🍫","🍿","🍩","🍪","🥛","🍼","☕️","🍺","🍹","🥄","🍽","🍲","🍦"],
                          "sport":     ["⚽️","🏀","🥇","🎾","🏋🏻","🏉","🎱","🏓","🥊","🥋","🎿","⛸","🏂","🏄🏼‍♀️","🚵🏻‍♀️"],
                          "transport": ["🚒","🚐","🛴","🚛","🚎","🚑","🏍","🚠","🚂","🚁","✈️","🚀","⛴","⛽️","🚗"]]
    
    var emojiChoices = [String]()
    
    init(numberOfPairstOfCads: Int) {
        self.numberOfPairstOfCads = numberOfPairstOfCads
        var listOfThemeNumber = Array(emojiThemeList.keys)
        
        let nameOfTheme = getRandomElem(for: &listOfThemeNumber)!
        self.emojiChoices = emojiThemeList[nameOfTheme]!
    }
    
    
    func getEmoji() -> String{
        return getRandomElem(for: &emojiChoices) ?? "?"
    }
    
    
    func getRandomElem<T>(for array: inout [T]) -> T?{
        if array.count > 0 {
            let randomIdx = Int(arc4random_uniform(UInt32(array.count)))
            return array.remove(at: randomIdx)
        } else {
            return nil
        }
    }
    
}
