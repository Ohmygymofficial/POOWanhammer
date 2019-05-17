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
    
    convenience init() {
        self.init(name: Fighter.nameOfTheFighter(category: Category.colossus), numberFetich: Fighter.setNumberFetich(demo: false))
        self.weapon = Weapon(nameOfWeapon: "une main entourée de fer", powerOfWeapon: 5, weaponType: Weapon.WeaponType.fist)
        self.special = Special.fear
        self.lifePoint = 200
        // self.strenght = 5
        self.category = Category.colossus
    }
    
    // Constructor for demo mode
    override init(name: String, numberFetich: Int) {
        super.init(name: name, numberFetich: numberFetich)
        self.weapon = Weapon(nameOfWeapon: "une main entourée de fer", powerOfWeapon: 5, weaponType: Weapon.WeaponType.fist)
        self.special = Special.fear
        self.lifePoint = 200
        // self.strenght = 5
        self.category = Category.colossus
    }
    
    /**
     specialColossus : Fear for Colossus special attack
     */
    override func specialAttack(attackerChoosen: Fighter, whoReceiveChoosen: Fighter) {
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t😇😇😇😇 FETICH TIME 😇😇😇😇"
            + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre Colosse a fait peur a vos adversaires, vous avez droit à un deuxième tour  A CODER")
    }
}
