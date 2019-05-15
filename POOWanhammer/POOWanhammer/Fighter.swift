//
//  Characters.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Fighter { // by default, we choose Warrior
    
    var name : String
    var numberFetich : Int
    var category = Category.warrior.rawValue
    var weapon: String = Weapon.sword.rawValue
    var special: String = Special.doubleAttack.rawValue
    var lifePoint: Int = 100
    var strenght: Int = 10

    
    init(name: String, numberFetich: Int) {
        self.name = name
        self.numberFetich = numberFetich
    }
 
    
    /**
     specialAttack : Nothing on mother Class
     */
    func specialAttack(_ whichTeam: Int?, _ damageInLoad: Int?, _ resultBonusToPrint: String?) {}
    
    
    
    
    
    
    
    //func attack
    // func heal
    // func isDead
    
}
