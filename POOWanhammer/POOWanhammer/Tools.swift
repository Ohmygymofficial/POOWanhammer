//
//  Tools.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Tools { // create to ask some static thing at users
    
    
    
    /**
     giveGamerName : Take all the UserName
     */
    static func giveGamerName() -> String {
        
        if geek.firstUI {
            print("\r🔴 Joueur 1 : Quel est ton nom de Gamer ?")
        } else { print("\r🔵 Joueur 2 : Quel est ton nom de Gamer ?") }
        
        var pseudoOfGamerOk = ""
        if let pseudoOfGamer = readLine() {
            
            // check if already exist
            let isOk =  userAlreadyExist(what: pseudoOfGamer)
            if isOk  { //
                print("Ce pseudo existe déjà ... ^^  On en choisit un autre ? ")
                return giveGamerName()
            }
            
            // Check if it's empty
            if pseudoOfGamer == ""  { //
                print("Vous devez choisir un nom de Gamer : Avec des lettres ;)")
                return giveGamerName()
            }
            
            // check if is not a INT  (VOIR AVEC LILIAN COMMENT VERIFIER QU'IL N'Y A PAS DE CHIFFRE DANS CETTE SAISIE
            //var isInt : Bool
            //if pseudoOfGamer == Int(pseudoOfGamer) {
            //   isInt = true
            //}
            
            // if the code can read this, is that the User Input is ok !
            pseudoOfGamerOk = pseudoOfGamer
        }
        return pseudoOfGamerOk
    }
    
    
    
    /**
     giveTeamName : Take all the Team Name
     */
    static func giveTeamName() -> String {
        
            print("\r Ton nom de TEAM ?")
        
        var teamOfGamerOk = ""
        if let teamOfGamer = readLine() {
            
            // check if already exist
            let isOk =  teamAlreadyExist(what: teamOfGamer)
            if isOk  { //
                print("Cette TEAM existe déjà ... ^^  On en choisit une autre ? ")
                return giveTeamName()
            }
            
            // Check if it's empty
            if teamOfGamer == ""  { //
                print("Vous devez choisir un nom de TEAM : Avec des lettres ;)")
                return giveTeamName()
            }
            
            // if the code can read this, is that the User Input is ok !
            teamOfGamerOk = teamOfGamer
        }
        return teamOfGamerOk
    }
    
    /*
          
     
     
     // giveFighterName
     // private alreadyUsed
     */
    
    /**
     userAlreadyExist : Static func to check if one User Input already exist thanks to the return
     */
    static func userAlreadyExist(what : String) -> Bool {
        
        
        if !geek.firstUI { //only if it's the second User Input
            // for the userName (compare to the user 1)
            if what.uppercased() == geek.playersArray[0].gamerName.uppercased() {
                return true
            }
        }
        return false
    }
    
    /**
     teamAlreadyExist : Static func to check if one User Input already exist thanks to the return
     */
    static func teamAlreadyExist(what : String) -> Bool {
        
        
        if !geek.firstUI { //only if it's the second User Input
            // for the teamName (compare to the user 1)
            if what.uppercased() == geek.playersArray[0].teamName.uppercased() {
                return true
            }
        }
        return false
    }
    
    
    /**
     pause : To make a pause in execution, and wait about touch press about user
     */
    static func pause() {
        
        print("Appuyer sur Entrer pour continuer..")
        _ = readLine()
        
    }
    
    
}

