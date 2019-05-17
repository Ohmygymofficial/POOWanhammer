//
//  Warrior.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 15/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation
class Warrior : Fighter {
    
    
    // To have choice with init
    convenience init() {
        self.init(name: Fighter.nameOfTheFighter(category: Category.warrior), numberFetich: Fighter.setNumberFetich(demo: false))
        self.weapon = Weapon(nameOfWeapon: "son épée", powerOfWeapon: 10, weaponType: Weapon.WeaponType.sword)
        self.special = Special.doubleAttack
        self.lifePoint = 100
        // self.strenght = 10
        self.category = Category.warrior
    }
    
    // Constructor for demo mode
    override init(name: String, numberFetich: Int) {
        super.init(name: name, numberFetich: numberFetich)
        self.weapon = Weapon(nameOfWeapon: "son épée", powerOfWeapon: 10, weaponType: Weapon.WeaponType.sword)
        self.special = Special.doubleAttack
        self.lifePoint = 100
        // self.strenght = 10
        self.category = Category.warrior
    }
    
    /*
    init() {
        super.init(name: Fighter.nameOfTheFighter(category: Category.warrior), numberFetich: Fighter.setNumberFetich(demo: false))
        self.weapon = Weapon(nameOfWeapon: "son épée", powerOfWeapon: 10, weaponType: Weapon.WeaponType.sword)
        self.special = Special.doubleAttack
        self.lifePoint = 100
        // self.strenght = 10
        self.category = Category.warrior
    }
 */


    
    /**
     specialWarrior : Double Attack for Warrior special attack
     */
    override func specialAttack(_ whichTeam: Int?, _ damageInLoad: Int?, _ resultBonusToPrint: String?) {
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t😇😇😇😇 FETICH TIME 😇😇😇😇"
            + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre combattant possède une deuxième attaque  A CODER ")
    }
}


