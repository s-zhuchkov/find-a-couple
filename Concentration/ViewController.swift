//
//  ViewController.swift
//  Concentration
//
//  Created by serg on 18/02/2018.
//  Copyright © 2018 serg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipsLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var bonusLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var newGame: UIButton!
    
    
    
    // 3 / 2 = 1 (for int type) int целочисленный тип, происходит приведение типов
    //Cannot use instance member 'cardButtons' within property initializer; property initializers run before 'self' is available
    // you can't use property observes for "lasy"
    var game: Concetration?
    var emoji: Emoji?
    
    override func viewDidLoad() {
        newGame(self.newGame)
    }
    
    @IBAction func newGame(_ sender: Any) {
        /*
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view) // This line causes the view to be reloaded*/
        
        game = Concetration(numberOfPairstOfCads: (cardButtons.count + 1) / 2)
        emoji = Emoji(numberOfPairstOfCads: (cardButtons.count + 1) / 2)
        initEmojiCards()
        updateViewFromModel()
        self.view.backgroundColor = emoji?.getBackGroundColor()
    }
    
    
    @IBAction func touchCart(_ sender: UIButton) {
        
        if let cardNumber = cardButtons.index(of: sender){
            game!.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
        
    }
    
    func updateViewFromModel(){
        
        flipsLabel.text = "Flips: \(game!.flipCount)"
        scoreLabel.text = "Score: \(game!.scoreAmount)"
        bonusLabel.text = "Bonus: \(game!.getTimeScore() ?? "0")"
        
        for index in cardButtons.indices{
            let card: Card = game!.cards[index]
            let button = cardButtons[index]
            
            if card.isFaseUp{
                button.setTitle(emojiCards[card.identifier], for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)

                if card.isMatched{
                    button.backgroundColor = #colorLiteral(red: 0.03864920512, green: 0.03963567317, blue: 0.01334425248, alpha: 0)
                    button.isEnabled = false
                } else {
                    button.backgroundColor = emoji?.getCardColor()
                    button.isEnabled = true
                }
            }
            
            //uncoment show cards
            //button.setTitle(emojiCards[card.identifier], for: UIControlState.normal)
        }
    }

    
    // usual variant implemente dictioanry
    // var emoji1 = Dictionary<Int, String>()
    // short variant implement dictioanary
    var emojiCards = [Int: String]()
    
    func initEmojiCards(){
        emojiCards.removeAll()
        
        for index in game!.cards.indices{
            let card = game!.cards[index]
            if emojiCards[card.identifier] == nil {
                emojiCards[card.identifier] = emoji?.getEmoji() ?? "?"
            }
        }
    }
    

}
