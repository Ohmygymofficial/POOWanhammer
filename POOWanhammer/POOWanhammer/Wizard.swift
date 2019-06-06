//
//  Wizard.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 15/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Wizard : Fighter {
    
    override init(firstUI: Bool) {
        super.init(firstUI: firstUI)
        self.name = nameOfTheFighter(category: Category.wizard)
        self.numberFetich = setNumberFetich(demo: false)
        self.weapon = Weapon(nameOfWeapon: "une baguette", powerOfWeapon: 15, weaponType: Weapon.WeaponType.wand)
        self.special = Special.fireball
        self.lifePoint = 125
        // self.strenght = 15
        self.category = Category.wizard
    }
    
    // Constructor for demo mode
    override init(name: String, numberFetich: Int) {
        super.init(name: name, numberFetich: numberFetich)
        self.weapon = Weapon(nameOfWeapon: "une baguette", powerOfWeapon: 15, weaponType: Weapon.WeaponType.wand)
        self.special = Special.fireball
        self.lifePoint = 125
        // self.strenght = 15
        self.category = Category.wizard
    }
    
    
    /**
     specialWizard : FireBall for Wizard special attack : Give 30 / 20 or 10 value to the fireball and the good damage on the fighter's
     */
    override func specialAttack(attackerChoosen: Fighter, whoReceiveChoosen: Fighter, defenderIs: Players, attackerIs: Players, bonusIsLuck: Bool, bonusZone: Bool) {
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre magicien envoi une Fireball et enlève :")
        var fireballDamage = 30 // this the power of this fetichTime
        var counterFireball = 0
        //take a first loop to check how many fighters are alive
        for i in 0..<defenderIs.fightersArray.count {
            if defenderIs.fightersArray[i].lifePoint > 0 {
                counterFireball += 1
            }
        }
        fireballDamage = 30 / counterFireball //give a value to fireball 10 20 or 30
        for i in 0..<defenderIs.fightersArray.count { //aply the damage to the fighters are alive
            if defenderIs.fightersArray[i].lifePoint > 0 {
                defenderIs.fightersArray[i].lifePoint -= fireballDamage
                print("\(fireballDamage) points de dommages à \(defenderIs.fightersArray[i].name) le \(defenderIs.fightersArray[i].category). Il se retrouve à \(defenderIs.fightersArray[i].lifePoint)")
            }
        }
    }
}
