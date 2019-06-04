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
    override init() {
        super.init()
        self.name = nameOfTheFighter(category: Category.warrior)
        self.weapon = Weapon(nameOfWeapon: "une épée", powerOfWeapon: 10, weaponType: Weapon.WeaponType.sword)
        self.special = Special.doubleAttack
        self.lifePoint = 10
        self.category = Category.warrior
    }
    
    // Constructor for demo mode
    override init(name: String, numberFetich: Int) {
        super.init(name: name, numberFetich: numberFetich)
        self.weapon = Weapon(nameOfWeapon: "une épée", powerOfWeapon: 10, weaponType: Weapon.WeaponType.sword)
        self.special = Special.doubleAttack
        self.lifePoint = 10
        self.category = Category.warrior
    }
    
    
    /**
     specialWarrior : Double Attack for Warrior special attack
     */
    override func specialAttack(attackerChoosen: Fighter, whoReceiveChoosen: Fighter, defenderIs: Players, attackerIs: Players) {
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre combattant possède une deuxième attaque :")
        // initialisation of defender / whoReceive the action REFACTO POSSIBLE because already exist in Class Game func fight()
        defenderIs.printListOfDefender(attackerIs: attackerIs, defenderIs: defenderIs, attackerChoosen: attackerChoosen)
        // whoReceiveChoosen is the fighter whoReceive The action
        let whoReceiveChoosen = defenderIs.chooseFighterDefend(defenderIs: defenderIs, attackerIs: attackerIs, attackerChoosen: attackerChoosen)
        print("Celui qui va recevoir l'attaque spéciale est : \(whoReceiveChoosen.name) le \(whoReceiveChoosen.category)")
    }
}


