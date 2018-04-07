//
//  Emoji.swift
//  Concentration
//
//  Created by serg on 11/03/2018.
//  Copyright © 2018 serg. All rights reserved.
//

import Foundation
import UIKit

class Emoji {
    
    
    var numberOfPairstOfCads: Int
    
    var emojiChoices = [String]()
    
    var nameOfTheme = ""
    
    var emojiThemeList: [String : [Any]] = ["smileys":   [["😈","👹","😇","😂","😨","😱","👻","🤥","😬","🤢","🤧","💀","☠️","🤖","🎃"], UIColor.black, UIColor.magenta],
                          "animals":   [["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐷","🐥","🦆","🦉"], UIColor.darkGray, UIColor.blue],
                          "plants":    [["🌵","🎄","🌲","🌳","🌴","🌱","🍀","🎋","🍂","🍄","💐","🌹","🌻","🌼","🌸"], UIColor(red: 0, green: 160/255, blue: 0, alpha: 1), UIColor.green],
                          "fruits":    [["🍏","🍎","🍐","🍊","🍆","🥒","🌽","🥝","🍌","🍉","🍇","🍟","🌰","🍒","🍓"], UIColor.black, UIColor.orange],
                          "coffee":    [["🍭","🍬","🍫","🍿","🍩","🍪","🥛","🍼","☕️","🍺","🍹","🥄","🍽","🍲","🍦"], #colorLiteral(red: 0.7388837934, green: 0.6520578861, blue: 0.08651191741, alpha: 1), #colorLiteral(red: 0.4535393119, green: 0.3096830249, blue: 0.08672664315, alpha: 1)],
                          "sport":     [["⚽️","🏀","🥇","🎾","🏋🏻","🏉","🎱","🏓","🥊","🥋","🎿","⛸","🏂","🏄🏼‍♀️","🚵🏻‍♀️"], #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.1436471939, green: 0, blue: 0.9969809651, alpha: 1)],
                          "transport": [["🚒","🚐","🛴","🚛","🚎","🚑","🏍","🚠","🚂","🚁","✈️","🚀","⛴","⛽️","🚗"], #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)]]
    
    
    
    
    init(numberOfPairstOfCads: Int) {
        self.numberOfPairstOfCads = numberOfPairstOfCads
        var listOfThemeNumber = Array(emojiThemeList.keys)
        
        self.nameOfTheme = getRandomElem(for: &listOfThemeNumber)!
        self.emojiChoices = getEmojiList()
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
    
    func getEmojiList() -> [String] {
        return emojiThemeList[self.nameOfTheme]![0] as! [String]
    }
    
    func getCardColor() -> UIColor {
        return emojiThemeList[self.nameOfTheme]![2] as! UIColor
    }
    
    func getBackGroundColor() -> UIColor {
        return emojiThemeList[self.nameOfTheme]![1] as! UIColor
    }
    
}
