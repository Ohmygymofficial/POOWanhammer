//
//  Dwarf.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 15/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Dwarf : Fighter {
    
    override init(name: String, numberFetich: Int) {
        super.init(name: name, numberFetich: numberFetich)
        self.weapon = Weapon.axe.rawValue
        self.special = Special.doubleDamage.rawValue
        self.lifePoint = 80
        self.strenght = 20
        self.category = Category.dwarf.rawValue
    }
    
    
    /**
     specialDwarf : Double Damage for Dwarf special attack
     */
    override func specialAttack(_ whichTeam: Int?, _ damageInLoad: Int?, _ resultBonusToPrint: String?) {
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t😇😇😇😇 FETICH TIME 😇😇😇😇"
            + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre nain est en forme, il affligera double dégâts ce tour-ci !  A CODER ")
    }
}