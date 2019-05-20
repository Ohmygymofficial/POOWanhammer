//
//  Weapon.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation


class Weapon {
    
    // We defined here all the different weapons possibles of fighters
    enum WeaponType {
        
        case sword, axe, wand, fist, goldSword, rahanAxe, grenade, weaponFlail, corkscrew, broccoli, proteinBar, bananaWhey, raspberry, bigMac, chestSurprise
    }
    
    var nameOfWeapon : String
    var powerOfWeapon : Int
    var weaponType : WeaponType
    
    init(nameOfWeapon: String, powerOfWeapon :Int, weaponType: WeaponType) {
        self.nameOfWeapon = nameOfWeapon
        self.powerOfWeapon = powerOfWeapon
        self.weaponType = weaponType
    }
    
}
