//
//  Bonus.swift
//  POOWanhammer
//
//  Created by Erwan Paste iMac on 20/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Bonus {
    
    // We defined here all the different type of bonus/unluck
    enum bonusType {
        
        case fBonus1, fBonus2, fBonus3, fBonus4, fBonus5, wBonus1, wBonus2, wBonus3, randomBonusZone
        
    }
    
    var HistoryOfBonus : String
    var powerOfBonus : Int
    var bonusType : bonusType
    
    init(HistoryOfBonus: String, powerOfBonus :Int, bonusType: bonusType) {
        self.HistoryOfBonus = ""
        self.powerOfBonus = 0
        self.bonusType = bonusType
    }
    
}
