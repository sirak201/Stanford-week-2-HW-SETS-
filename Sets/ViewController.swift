//
//  ViewController.swift
//  Sets
//
//  Created by Sirak Zeray on 12/28/18.
//  Copyright © 2018 Sirak Zeray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

   var set = Set()

    @IBOutlet weak var scoreLabel: UILabel! {
        didSet {
            scoreLabel.text =  "Score : \(set.score)"
        }
    }
   var selectedCards = [Int]()
    
    @IBOutlet var cardButtons: [UIButton]!{
        didSet {
            newGame()
            var startIndex = 2
            for i in cardButtons {
                i.tag = startIndex
                startIndex += 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func handThree(_ sender: UIButton) {
        if set.cards.count >= 3 || set.displayCards.count == 24 {
        var counter = 0
        for i in cardButtons.indices {
            if cardButtons[i].alpha == 0 ,counter < 3 {
                cardButtons[i].alpha = 1
                cardButtons[i].setAttributedTitle(getNewAttrbutedString(at: i), for: .normal)
                counter += 1
            }
        }
    }
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
            newGame()
        selectedCards = [Int]()
        scoreLabel.text =  "Score : "
    }
    
    
    @IBAction func cardSelected(_ sender: UIButton) {
        if  sender.layer.borderWidth == 4.0 {
            return
        }
        sender.layer.borderWidth = 4.0
        sender.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        checkSelected()
       
    }
    

    
    private func checkSelected(){
       
        if selectedCards.count > 3 {
            selectedCards = [Int]()
        }
        for i in cardButtons.indices{
            if cardButtons[i].layer.borderWidth != 0 && cardButtons[i].tag != 1{
                cardButtons[i].tag = 1
                selectedCards.append(i)
            }
        }
        if selectedCards.count == 3 {
            if set.checkIfSet(indexs: selectedCards){
                for i in selectedCards{
                    SetMy(selectedButton: cardButtons[i], isSelected: true, alpha: 0)
                }
                selectedCards = [Int]()
                scoreLabel.text =  "Score : \(set.score)"
            } else {
                for i in selectedCards{
                    SetMy(selectedButton: cardButtons[i], isSelected: true, alpha: 1)
                }
                scoreLabel.text =  "Score : \(set.score)"
                selectedCards = [Int]()
            }
        }
    }
    
    private func newGame(){
        set = Set()
        for i in cardButtons.indices{
            cardButtons[i].setAttributedTitle(getNewAttrbutedString(at: i), for: .normal)
            SetMy(selectedButton: cardButtons[i], isSelected: false, alpha: nil)
            if i > 11 {
                cardButtons[i].alpha = 0
            }
        }
    }
    
    private func SetMy(selectedButton button : UIButton , isSelected : Bool , alpha : CGFloat?){
        if !isSelected{
            button.layer.cornerRadius = 8.0
            button.layer.borderWidth = 0
            button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.alpha = 1
        } else{
            button.layer.borderWidth = 0
            button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            button.alpha = alpha ?? 0
            button.tag = 0
        }
    }
    
    
    private func getNewAttrbutedString(at i : Int)-> NSAttributedString{

        let randomColor = UIColor().getRandomColors(amount: 5).randomElement()
        let randomNumber = 3.getRandomNumber()
        
        let arrayOfAttribute : [[NSAttributedString.Key : Any]] = [[
            NSAttributedString.Key.strokeWidth : 10,
            NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : randomColor!
            ] ,
           [
            NSAttributedString.Key.strokeWidth : -20,
            NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : randomColor!
            ],
           [
            NSAttributedString.Key.strokeWidth : -20,
            NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : randomColor!.withAlphaComponent(0.25) as Any
            ]
            ]
        
        switch randomNumber {
        case 0 :
            let myNormalAttributedTitle = NSAttributedString(string: set.displayCards[i].shape ,
                                                             attributes:arrayOfAttribute[0])
            set.displayCards[i].isFilled = .notFilled
            set.displayCards[i].cardColor = randomColor!
            return myNormalAttributedTitle
        case  1 :
            let myNormalAttributedTitle = NSAttributedString(string: set.displayCards[i].shape ,
                                                             attributes:arrayOfAttribute[1])
            set.displayCards[i].isFilled = .filled
            set.displayCards[i].cardColor = randomColor!
            return myNormalAttributedTitle
        default:
            let myNormalAttributedTitle = NSAttributedString(string: set.displayCards[i].shape ,
                                                             attributes:arrayOfAttribute[2])
            set.displayCards[i].isFilled = .shaded
            set.displayCards[i].cardColor = randomColor!
            return myNormalAttributedTitle
        }
    }


    
    
    
    
    
    
}











