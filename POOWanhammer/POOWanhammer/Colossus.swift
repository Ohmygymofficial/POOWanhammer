//
//  Colossus.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 15/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Colossus : Fighter {
    
    // PLEASE do an enum for WEAPON and SPECIAL like I did for Category ;)
    // To get a string of the value in the enum in main.swift it's : figherObject.category.rawValue
    
    init() {
        super.init(name: Fighter.nameOfTheFighter(category: Category.colossus), numberFetich: Fighter.setNumberFetich())
        self.weapon = Weapon.fist
        self.special = Special.fear
        self.lifePoint = 200
        self.strenght = 5
        self.category = Category.colossus
    }
    
    /**
     specialColossus : Fear for Colossus special attack
     */
    override func specialAttack(_ whichTeam: Int?, _ damageInLoad: Int?, _ resultBonusToPrint: String?) {
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t😇😇😇😇 FETICH TIME 😇😇😇😇"
            + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre Colosse a fait peur a vos adversaires, vous avez droit à un deuxième tour  A CODER")
    }
}
