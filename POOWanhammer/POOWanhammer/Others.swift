//
//  Others.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Others { // create to ask some static thing at users
    
    // to archive all the fighter name and check is Unique
    static var allFighterName = [String]()
    

        

        
        
        
        /**
         userAlreadyExist : Static func to check if one User Input already exist thanks to the return
         */
        static func userAlreadyExist(what : String) -> Bool {
            
            
            if !game.firstUI { //only if it's the second User Input
                // for the userName (compare to the user 1)
                if what.uppercased() == game.playersArray[0].gamerName.uppercased() {
                    return true
                }
            }
            return false
        }
        
        
        /**
         teamAlreadyExist : Static func to check if one User Input already exist thanks to the return
         */
        static func teamAlreadyExist(what : String) -> Bool {
            
            
            if !game.firstUI { //only if it's the second User Input
                // for the teamName (compare to the user 1)
                if what.uppercased() == game.playersArray[0].teamName.uppercased() {
                    return true
                }
            }
            return false
        }
        
        /**
         fighterAlreadyExist : Static func to check if one User Input already exist thanks to the return
         */
        static func fighterAlreadyExist(what : String) -> Bool {
            
            // peut être créer un tableau qui stocke les noms des fighters, toute team confondue, et compare en LOOP dedans ?
            
            // add one "" to initialize the array on the first User Input
            if game.firstUI {
                allFighterName.append("")
            }
            
            for eachFighter in allFighterName {
                if what.uppercased() == eachFighter.uppercased() {
                    return true
                }
            }
            // if it's OK : We add this one in the Array
            allFighterName.append(what)
            return false
        }
        
        
        
        /**
         FightersSettings : To print the caracteristic of the Fighters
         */
        static func FightersSettings() {
            print("Voici les caractéristiques des personnages :"
                + "\n 🗡 Le \(Category.warrior.rawValue): PV : 100, Dégâts : 10, spécial : Double Attaque"
                + "\n 👨‍🎤 Le \(Category.dwarf.rawValue) : PV : 80, Arme : Hâche, Dégâts : 20, spécial : Double Dégâts"
                + "\n 👹 Le \(Category.colossus.rawValue) : PV : 200, Dégâts : 5, spécial : Frayeur (Adversaire perd son tour)"
                + "\n 🧙‍♀️ Le \(Category.wizard.rawValue) : PV : 150, Soins : +15, spécial : FireBall dégâts 30")
        }
        
        
        /**
         pause : To make a pause in execution, and wait about touch press about user
         */
        static func pause() {
            
            print("Appuyer sur Entrer pour continuer..")
            _ = readLine()
            
        }
        
        
}

