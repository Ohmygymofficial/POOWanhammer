//
//  Colossus.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 15/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Colossus : Fighter {
    
 
    override init() {
        super.init()
        self.name = nameOfTheFighter(category: Category.colossus)
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
    override func specialAttack(attackerChoosen: Fighter, whoReceiveChoosen: Fighter, defenderIs: Players, attackerIs: Players) {
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre Colosse a fait peur a vos adversaires, vous avez droit à un deuxième tour")
        // propose attacker fighter :
        attackerIs.printListOfAttacker(attackerIs: attackerIs)
        // attackerChoosen is the good fighter who give the action
        let attackerChoosen = attackerIs.chooseFighterAttack(attackerIs: attackerIs)
        print("L'attaquant choisit est : \(attackerChoosen.name) le \(attackerChoosen.category)")
        
        // initialisation of defender / whoReceive the action
        defenderIs.printListOfDefender(attackerIs: attackerIs, defenderIs: defenderIs, attackerChoosen: attackerChoosen)
        // whoReceiveChoosen is the fighter whoReceive The action
        let whoReceiveChoosen = defenderIs.chooseFighterDefend(defenderIs: defenderIs, attackerIs: attackerIs, attackerChoosen: attackerChoosen)
        print("Celui qui va recevoir l'action est : \(whoReceiveChoosen.name) le \(whoReceiveChoosen.category)")
    }
}
