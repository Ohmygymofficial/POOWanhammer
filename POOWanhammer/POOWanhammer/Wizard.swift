//
//  Wizard.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 15/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Wizard : Fighter {
    
    init() {
        super.init(name: Fighter.nameOfTheFighter(category: Category.wizard), numberFetich: Fighter.setNumberFetich())
        self.weapon = Weapon(nameOfWeapon: "sa baguette", powerOfWeapon: 15, weaponType: Weapon.WeaponType.wand)
        self.special = Special.fireball
        self.lifePoint = 125
        // self.strenght = 15
        self.category = Category.wizard
    }
    
    
    /**
     specialWizard : FireBall for Wizard special attack
     */
    override func specialAttack(_ whichTeam: Int?, _ damageInLoad: Int?, _ resultBonusToPrint: String?) {
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t😇😇😇😇 FETICH TIME 😇😇😇😇"
            + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre magicien envoi une Fireball et enlève : A CODER ")
    }
}
