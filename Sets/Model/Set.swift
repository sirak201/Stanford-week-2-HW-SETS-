//
//  Set.swift
//  Sets
//
//  Created by Sirak Zeray on 12/28/18.
//  Copyright © 2018 Sirak Zeray. All rights reserved.
//

import Foundation

class Set  {
 
    var cards = [Card]()
    var displayCards = [Card]()
    private(set) var score = 0
    
    func checkIfSet(indexs : [Int]) -> Bool{
        if displayCards[indexs[0]] === displayCards[indexs[1]] &&  displayCards[indexs[1]] === displayCards[indexs[2]]{
            for i in indexs{
                if cards.count > 0 {
                displayCards.remove(at: i)
                displayCards.insert(getNextCard(), at: i)
                } else {
                    displayCards.remove(at: i)
                }
            }
            score += 2
            return true
        }
        if checkCardAreDiffrent(indexs: indexs){
            for i in indexs{
                if cards.count > 0 {
                displayCards.remove(at: i)
                displayCards.insert(getNextCard(), at: i)
                } else {
                    displayCards.remove(at: i)
                }
            }
            score += 2
            return true

        }
     score -= 3
     return false
        
    }
    
    private func getNextCard()-> Card{
        return cards.remove(at: 0)
    }
    
   private func checkCardAreDiffrent(indexs : [Int]) -> Bool {
     
        if  displayCards[indexs[0]] !== displayCards[indexs[1]]  {
            if  displayCards[indexs[2]] !== displayCards[indexs[1]] {
                if  displayCards[indexs[2]] !== displayCards[indexs[0]] {
                    return true
                }
            }
        }
        return false
    }
    
    init() {
        for i in 1...81 {
            let card = Card()
            if i <= 24 {
                displayCards.append(card)
            } else {
                 cards.append(card)
            }
        }
    }
    
}


