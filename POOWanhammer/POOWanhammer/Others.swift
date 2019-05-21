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
    static func distributionCareOrDamage(attackerChoosen: Fighter,whoReceiveChoosen: Fighter, defenderIs: Players, attackerIs: Players, bonusIsLuck: Bool, bonusZone: Bool) {
        
        //MICHEL MICHEL : A finir ...
        // var powerOfTheAction
        // Depend of "Weapon Strenght" if it's a normal action
        var powerOfTheAction = attackerChoosen.weapon.powerOfWeapon
        
        // depend If the Attacker have a Bonus zone
        if bonusZone == true {
            print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  BONUS ZONE !!!!!")
            powerOfTheAction = attackerChoosen.bonusZone.powerOfBonus
            // and the fighter who receive the action depend of the result of bonusIsLuck
            if bonusIsLuck == true { //if is lucky
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t LUCKY DAY !!!!!")
                if attackerChoosen.category != Category.wizard { // for Fighters : give Damage to a random opponent fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(defenderIs.fightersArray.count)))
                    defenderIs.fightersArray[randomFighterIs].lifePoint -= powerOfTheAction
                    // print result
                    Others.actionPrint(attackerChoosen: attackerChoosen, whoReceiveChoosen: defenderIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
                    //update TeamLifePoint
                    Others.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
                    
                    
                } else { // for wizard : Add powerOfTheAction to a random Team Fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(attackerIs.fightersArray.count)))
                    attackerIs.fightersArray[randomFighterIs].lifePoint += powerOfTheAction
                    // print result
                    Others.actionPrint(attackerChoosen: attackerChoosen, whoReceiveChoosen: attackerIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
                    //update TeamLifePoint
                    Others.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
                    
                    
                }
                
            } else {
                //if is UNlucky
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t UNLUCKY BAD DAY !!!!!")
                if attackerChoosen.category != Category.wizard { // for Fighters : give Damage to a random TEAM fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(attackerIs.fightersArray.count)))
                    attackerIs.fightersArray[randomFighterIs].lifePoint -= powerOfTheAction
                    // print result
                    Others.actionPrint(attackerChoosen: attackerChoosen, whoReceiveChoosen: attackerIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
                    //update TeamLifePoint
                    Others.updateTeamLifePointAndArray(defenderIs: attackerIs, attackerIs: attackerIs)
                    
                    
                } else { // for wizard : Add powerOfTheAction to a random opponent Fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(defenderIs.fightersArray.count)))
                    defenderIs.fightersArray[randomFighterIs].lifePoint += powerOfTheAction
                    // print result
                    Others.actionPrint(attackerChoosen: attackerChoosen, whoReceiveChoosen: defenderIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
                    //update TeamLifePoint
                    Others.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
                    
                }
            }
        } else { // IF BONUS ZONE IS FALSE
            if attackerChoosen.category != Category.wizard {
                whoReceiveChoosen.lifePoint -= attackerChoosen.weapon.powerOfWeapon
                // give 0 value if the fighter is dead (no negative count)
                if whoReceiveChoosen.lifePoint <= 0 {
                    print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t🦴🦴🦴 WOWWWW LE WANHAMMER SE REDUIT : \(whoReceiveChoosen.name) est mort !🦴🦴🦴")
                    whoReceiveChoosen.lifePoint = 0
                }
            } else {
                whoReceiveChoosen.lifePoint += attackerChoosen.weapon.powerOfWeapon
            }
            
        }
    }
    
    
    /**
     checkTeamAreAlive : check if a team is Dead
     */
    static func checkTeamAreAlive(attackerIs: Players, defenderIs: Players) -> Bool {
        
        //Stop the fight if a team is dead during a Round
        if defenderIs.fightersArray.count == 0 {
            return true
        } else if attackerIs.fightersArray.count == 0 {
            return true
        } else { return false }
    }
    
    
   
    /**
     updateTeamLifePointAndArray : To Update lifePoint and remove Dead Fighter
     */
    static func updateTeamLifePointAndArray(defenderIs: Players, attackerIs: Players) {
        
        //Update Array AND REMOVE dead fighter
        var i = 0
        for fighter in defenderIs.fightersArray {
            if fighter.lifePoint <= 0 {
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t🦴🦴🦴 WOOWWWW : Le fighter \(fighter.name) va être sorti du tableau car il est mort !")
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
    static func actionPrint(attackerChoosen: Fighter, whoReceiveChoosen: Fighter, bonusZone: Bool) {
        
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

        if attackerChoosen.name == whoReceiveChoosen.name {
            whoReceive = "lui même"
        } else {
            whoReceive = whoReceiveChoosen.name + " le " + whoReceiveChoosen.category.rawValue
        }
        
        if bonusZone == true {
            print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t \(attackerChoosen.name) le \(attackerChoosen.category.rawValue) \(attackerChoosen.bonusZone.HistoryOfBonus)"
                + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t \(whoReceive)")
            print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Celui-ci \(gainOrLoose) \(attackerChoosen.bonusZone.powerOfBonus) PV et en possède maintenant \(whoReceiveChoosen.lifePoint)")
        } else {
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Voici l'historique de l'action réalisée : "
            + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t \(attackerChoosen.name) le \(attackerChoosen.category.rawValue)"
            + "\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t a fait \(attackOrCare) sur \(whoReceive)")
            // This is the commun message
            print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Celui-ci \(gainOrLoose) \(attackerChoosen.weapon.powerOfWeapon) PV et en possède maintenant \(whoReceiveChoosen.lifePoint)")
        }
        
        //"prend confiance et envoit un autre coup puissant au ventre de "
        
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

