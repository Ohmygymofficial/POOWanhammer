//
//  Dwarf.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 15/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Dwarf : Fighter {
    
    override init(firstUI: Bool) {
        super.init(firstUI: firstUI)
        self.name = nameOfTheFighter(category: Category.dwarf)
        self.numberFetich = setNumberFetich(demo: false)
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
        self.lifePoint = 8
        // self.strenght = 20
        self.category = Category.dwarf
    }
    
    
    /**
     specialDwarf : Double Damage for Dwarf special attack
     */
    override func specialAttack(attackerChoosen: Fighter, whoReceiveChoosen: Fighter, defenderIs: Players, attackerIs: Players) {
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre nain inflige double dégâts ce tour-ci !")
    }
}
