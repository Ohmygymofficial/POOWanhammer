//
//  Others.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Others { // create to ask some static thing at users
    
    
    
    /**
     printListOfAttacker() : Print List of attacker
    */
    static func printListOfAttacker(attackerIs: Players) {
        print("Avec qui souhaites=-tu agir ?")
        var n = 1
        for character in attackerIs.fightersArray {
            print("Tape \(n) pour choisir \(attackerIs.symbol)\(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
            n += 1
        }
    }
    
    /**
     printListOfDefender() : Print List of attacker
     */
    static func printListOfDefender(attackerIs: Players,defenderIs: Players, attackerChoosen: Fighter) {
        var healOrAttack = "attaquer"
        var whoReceiveTheAction = defenderIs
        if attackerChoosen.category != Category.wizard {
            print("Qui souhaites-tu attaquer ?")
        } else {
            print("Qui souhaites-tu guérir ?")
            whoReceiveTheAction = attackerIs
            healOrAttack = "soigner"
        }
        var n = 1
        for character in whoReceiveTheAction.fightersArray {
            print("Tape \(n) pour \(healOrAttack) \(whoReceiveTheAction.symbol)\(character.name) le \(character.category). PV = \(character.lifePoint)")
            n += 1
        }
    }
    
    /**
     distributionCareOrDamage : To update lifePoint of the good fighter (depend of the action)
 */
    static func distributionCareOrDamage(attackerChoosen: Fighter,whoReceiveChoosen: Fighter) {
        
        if attackerChoosen.category != Category.wizard {
            whoReceiveChoosen.lifePoint -= attackerChoosen.weapon.powerOfWeapon
        } else { whoReceiveChoosen.lifePoint += attackerChoosen.weapon.powerOfWeapon }
        // print result
        Others.actionPrint(attackerChoosen: attackerChoosen, whoReceiveChoosen: whoReceiveChoosen)
        
    }
    
    
    /**
     checkInt
     */
    static func checkInt() -> Int {
        
        if let answer = readLine() {
            if let answerOk = Int(answer) { // check if it's Int
                return answerOk
            } else { // if it's Int, so print :
                print("Cela ne peut être qu'un numéro !")
            }
        }
        // return this method until is not INT
        return checkInt()
    }
    
    
    /**
     actionPrint : To print result of the last action (depend of : Normal Action, Fetich Action, Bonus Action)
     */
    static func actionPrint(attackerChoosen: Fighter, whoReceiveChoosen: Fighter) {
        
        // Team.lifePointConvert() // if BONUS OR UNLUCKY ZONE has been used
        var attackOrCare = ""
        var gainOrLoose = ""
        var whoReceive = ""
        
        // take a var to print different word (depend of category : Wizard or no)
        if attackerChoosen.category == Category.wizard {
            attackOrCare = "un soin"
            gainOrLoose = "reçoit"
        } else {
            attackOrCare = "une attaque"
            gainOrLoose = "perd"
        }
        /*
        if geek.bonusOrUnluckZone == true || geek.fromUnluckZone == true { // if fighter came from bonus zone, print different message
            print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre \(historyPrint.hAttackerFCategory) \(historyPrint.hAttackerFName) \(resultBonusToPrint) ")
            if historyPrint.hAttackerFName == historyPrint.hDefenderFName {
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t....lui même ^^' !!")
            } else {
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\(historyPrint.hDefenderFName) le \(historyPrint.hDefenderFCategory) !!")
            }
        } else {
            */
            if attackerChoosen.name == whoReceiveChoosen.name {
                whoReceive = "lui même"
            } else {
                whoReceive = whoReceiveChoosen.name + " " + whoReceiveChoosen.category.rawValue
            }
 
            print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Voici l'historique de l'action réalisée : "
                + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Action Classique : \(attackerChoosen.name) le \(attackerChoosen.category.rawValue)"
                + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t a fait \(attackOrCare) sur \(whoReceive)")

        // This is the commun message
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Celui-ci \(gainOrLoose) \(attackerChoosen.weapon.powerOfWeapon) PV et en possède maintenant \(whoReceiveChoosen.lifePoint)")
        
        Others.pause()
    }
    
    
    
    
    /**
     pause : To make a pause in execution, and wait about touch press about user
     */
    static func pause() {
        
        print("Appuyer sur Entrer pour continuer..")
        _ = readLine()
        
    }
}

