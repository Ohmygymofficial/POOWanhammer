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
        print("\r\r\(attackerIs.gamerName) (PV:\(attackerIs.lifeTeam)): Avec qui souhaites-tu agir ?")
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
            print("\r\rQui souhaites-tu attaquer ?")
        } else {
            print("\r\rQui souhaites-tu guérir ?")
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
     distributionCareOrDamage : To update lifePoint of the good fighter (depend of the action)
     */
    static func distributionCareOrDamage(attackerChoosen: Fighter,whoReceiveChoosen: Fighter, defenderIs: Players, attackerIs: Players) {
        
        /* MICHEL MICHEL : A finir ...
        // var powerOfTheAction
        // Depend of "Weapon Strenght" if it's a normal action
        var powerOfTheAction = attackerChoosen.weapon.powerOfWeapon
        // depend If the Attacker have a Bonus zone
        
        if bonusZone = true {
        powerOfTheAction = attackerChoosen.weapon.powerOfWeapon
            bonusZone = false
        }
        // depend If the Attacker have a Bonus zone
        if UnluckZone = true {
            powerOfTheAction = attackerChoosen.weapon.powerOfWeapon
            UnluckZone = false
        }
        */
        
        //Update LifePoint of the Fighter
        if attackerChoosen.category != Category.wizard {
            whoReceiveChoosen.lifePoint -= attackerChoosen.weapon.powerOfWeapon
            // give 0 value if the fighter is dead (no negative count)
            if whoReceiveChoosen.lifePoint <= 0 {
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tWAOOWWWW il y en a un qui est mort : c'est : \(whoReceiveChoosen.name)")
                whoReceiveChoosen.lifePoint = 0
            }
        } else {
            whoReceiveChoosen.lifePoint += attackerChoosen.weapon.powerOfWeapon
        }
        //update TeamLifePoint
        Others.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
        
        // print result
        Others.actionPrint(attackerChoosen: attackerChoosen, whoReceiveChoosen: whoReceiveChoosen)
        
    }

    
    
    /**
     updateTeamLifePointAndArray : To Update lifePoint and remove Dead Fighter
     */
    static func updateTeamLifePointAndArray(defenderIs: Players, attackerIs: Players) {
        
        //Update Array AND REMOVE dead fighter
        var i = 0
        for fighter in defenderIs.fightersArray {
            if fighter.lifePoint <= 0 {
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVotre fighter \(fighter.name) va être sorti du tableau car il est mort !")
                defenderIs.fightersArray.remove(at: i)
            }
            i += 1
        }
        
        //Update Array and LifePoint of the Team
        defenderIs.lifeTeam = 0
        for i in 0..<defenderIs.fightersArray.count {
            defenderIs.lifeTeam += defenderIs.fightersArray[i].lifePoint
        }
        
        //Update Array and LifePoint of the Team
        attackerIs.lifeTeam = 0
        for i in 0..<attackerIs.fightersArray.count {
            attackerIs.lifeTeam += attackerIs.fightersArray[i].lifePoint
        }
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
            whoReceive = whoReceiveChoosen.name + " le " + whoReceiveChoosen.category.rawValue
        }
        
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Voici l'historique de l'action réalisée : "
            + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t \(attackerChoosen.name) le \(attackerChoosen.category.rawValue)"
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

