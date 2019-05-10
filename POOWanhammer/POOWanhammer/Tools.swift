//
//  Tools.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Tools { // create to ask some static thing at users
    
    
    // var names : [String]
    
    // giveGamerName
    static func giveGamerName1() {
        print("\r🔴 Joueur 1 : Quel est ton nom de Gamer ?")
    }
    static func giveGamerName2() {
        print("\r🔵 Joueur 2 : Quel est ton nom de Gamer ?")
    }
    
    // Give Team Name
    static func giveTeamName1() {
        print("\r🔴 Joueur 1 : Quel est ton nom de ta Team ?")
    }
    static func giveTeamName2() {
        print("\r🔵 Joueur 2 : Quel est ton nom de ta Team ?")
    }
    
    // Give Team Name
    static func welcome1(gamerName: String) {
        print("Bienvenue à toi")
    }
    static func welcome2(gamerName: String) {
        print("Bienvenue à toi aussi")
    }
    
    
    
    // giveFighterName
    // private alreadyUsed
    
    
    
    
    /**
     pause : To make a pause in execution, and wait about touch press about user
     */
    static func pause() {
        
        print("Appuyer sur Entrer pour continuer..")
        _ = readLine()
        
    }
    
    
}

