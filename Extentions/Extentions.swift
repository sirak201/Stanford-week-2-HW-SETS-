//
//  extentions.swift
//  Sets
//
//  Created by Sirak Zeray on 12/28/18.
//  Copyright © 2018 Sirak Zeray. All rights reserved.
//

import UIKit
extension Int {
    
    func getRandomNumber() -> Int{
        
        if self < 0 {
            return Int(arc4random_uniform(UInt32(-self)))
        }  else if  (self == 0) {
            return 0
        }
        return Int(arc4random_uniform(UInt32(self)))
        
    }
    
    
}

extension UIColor {
    
    func getRandomColors(amount : Int) -> [UIColor]{
        var pickedColors = [UIColor]()
        var colorArray : [UIColor] = [ .blue , .red , .green ]
        for _ in 0...amount{
            pickedColors.append(colorArray[colorArray.count.getRandomNumber()])
        }
        
        return colorArray
        
    }
    
    
    
    
}

extension NSAttributedString {
    
    func randomString(){
        
    }
    
    
    
    
    
    
}






