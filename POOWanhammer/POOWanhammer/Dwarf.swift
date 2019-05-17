//
//  Dwarf.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 15/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Dwarf : Fighter {
    
    convenience init() {
        self.init(name: Fighter.nameOfTheFighter(category: Category.dwarf), numberFetich: Fighter.setNumberFetich(demo: false))
        self.weapon = Weapon(nameOfWeapon: "une hache", powerOfWeapon: 20, weaponType: Weapon.WeaponType.axe)
        self.special = Special.doubleDamage
        self.lifePoint = 80
        // self.strenght = 20
        self.category = Category.dwarf
    }
    
    // Constructor for demo mode
    override init(name: String, numberFetich: Int) {
        super.init(name: name, numberFetich: numberFetich)
        self.weapon = Weapon(nameOfWeapon: "une hache", powerOfWeapon: 20, weaponType: Weapon.WeaponType.axe)
        self.special = Special.doubleDamage
        self.lifePoint = 80
        // self.strenght = 20
        self.category = Category.dwarf
    }
    
    
    /**
     specialDwarf : Double Damage for Dwarf special attack
     */
    override func specialAttack(_ whichTeam: Int?, _ damageInLoad: Int?, _ resultBonusToPrint: String?) {
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t😇😇😇😇 FETICH TIME 😇😇😇😇"
            + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre nain est en forme, il affligera double dégâts ce tour-ci !  A CODER ")
    }
}
