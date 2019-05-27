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
     updateCareOrDamage : To update lifePoint of the good fighter (depend of the action)
     */
    static func updateCareOrDamage(attackerChoosen: Fighter,whoReceiveChoosen: Fighter, defenderIs: Players, attackerIs: Players, bonusIsLuck: Bool, bonusZone: Bool) {
        
        // var powerOfTheAction : Depend of "Weapon Strenght" if it's a normal action
        var powerOfTheAction = attackerChoosen.weapon.powerOfWeapon
        
        // depend If the Attacker have a Bonus zone
        if bonusZone == true {
            print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t 😎😎😎 BONUS ZONE 😎😎😎!!!!!")
            powerOfTheAction = attackerChoosen.bonusZone.powerOfBonus
            // and the fighter who receive the action depend of the result of bonusIsLuck
            if bonusIsLuck == true { //if is lucky
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t LUCKY DAY !!!!!")
                if attackerChoosen.category != Category.wizard { // for Fighters : give Damage to a random opponent fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(defenderIs.fightersArray.count)))
                    defenderIs.fightersArray[randomFighterIs].lifePoint -= powerOfTheAction
                    // print result
                    Others.printAction(attackerChoosen: attackerChoosen, whoReceiveChoosen: defenderIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
                    //update TeamLifePoint
                    Others.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
                } else { // for wizard : Add powerOfTheAction to a random Team Fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(attackerIs.fightersArray.count)))
                    attackerIs.fightersArray[randomFighterIs].lifePoint += powerOfTheAction
                    // print result
                    Others.printAction(attackerChoosen: attackerChoosen, whoReceiveChoosen: attackerIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
                    //update TeamLifePoint
                    Others.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
                }
            } else {   //if is UNlucky
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t 🤬🤬🤬 UNLUCKY BAD DAY 🤬🤬🤬!!!!!")
                if attackerChoosen.category != Category.wizard { // for Fighters : give Damage to a random TEAM fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(attackerIs.fightersArray.count)))
                    attackerIs.fightersArray[randomFighterIs].lifePoint -= powerOfTheAction
                    // print result
                    Others.printAction(attackerChoosen: attackerChoosen, whoReceiveChoosen: attackerIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
                    //update TeamLifePoint
                    Others.updateTeamLifePointAndArray(defenderIs: attackerIs, attackerIs: attackerIs)
                
                } else { // for wizard : Add powerOfTheAction to a random opponent Fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(defenderIs.fightersArray.count)))
                    defenderIs.fightersArray[randomFighterIs].lifePoint += powerOfTheAction
                    // print result
                    Others.printAction(attackerChoosen: attackerChoosen, whoReceiveChoosen: defenderIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
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
    static func checkTeamAreAlive(attackerIs: Players, defenderIs: Players) {
        
        //Stop the fight if a team is dead during a Round
        if defenderIs.fightersArray.count == 0 {
            print("La team \(defenderIs.teamName) n'a plus de points de vie ! Tous les fighters sont morts !")
            return game.fight()
        } else if attackerIs.fightersArray.count == 0 {
            print("La team \(attackerIs.teamName) n'a plus de points de vie ! Tous les fighters sont morts !")
            return game.fight()
        }
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
        
        //Update Array and LifePoint of each Team
        var playerIs = defenderIs
        for _ in 0...1 {
            playerIs.lifeTeam = 0
            for i in 0..<playerIs.fightersArray.count {
                playerIs.lifeTeam += playerIs.fightersArray[i].lifePoint
            }
            playerIs = attackerIs
        }
    }
    
    
    /**
     actionPrint : To print result of the last action (depend of : Normal Action, Fetich Action, Bonus Action)
     */
    static func printAction(attackerChoosen: Fighter, whoReceiveChoosen: Fighter, bonusZone: Bool) {
        
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
        // to print on "himself" if the attacker is unluck
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
        Others.pause()
    }
    
    
    /**
     pause : To make a pause in execution, and wait about touch press about user
     */
    static func pause() {
        
        print("Appuyer sur Entrer pour continuer..")
        _ = readLine()
        
    }
    
    
    /**
     printFinalScore : To print result of the last action (depend of : Normal Action, Fetich Action, Bonus Action)
     */
    static func printFinalScore(defenderIs: Players, attackerIs: Players) {
        print("Cette partie est terminé, voici les scores :"
        + "\r\(attackerIs.gamerName) avec sa team \(attackerIs.teamName) termine avec \(attackerIs.lifeTeam)"
        + "\r\(defenderIs.gamerName) avec sa team \(defenderIs.teamName) termine avec \(defenderIs.lifeTeam)")
    }
    
    
    /**
     updateCounterLooseAndWin : To update score of each Gamer Team
     */
    static func updateCounterLooseAndWin(defenderIs: Players, attackerIs: Players) {
        
        if attackerIs.lifeTeam > defenderIs.lifeTeam {
            attackerIs.winCounter += 1
            defenderIs.looseCounter += 1
        } else {
            attackerIs.looseCounter += 1
            defenderIs.winCounter += 1
        }
        print("\rEtat des manches gagnées pour \(attackerIs.gamerName) avec sa team \(attackerIs.teamName) : \(attackerIs.winCounter)")
        print("\rEtat des manches gagnées pour \(defenderIs.gamerName) avec sa team \(defenderIs.teamName) : \(defenderIs.winCounter)")
    }
    
    
    /**
     resetTeamForRevenge : To reset Fighters and start a new fight
     */
    static func resetTeamForRevenge(defenderIs: Players, attackerIs: Players) {
     
        var playerIs = attackerIs
        for _ in 0...1 {
            //remove all fighter in FighterArray
            playerIs.fightersArray.removeAll()
            // add new fighter with fighterArraySaved
            for fighter in playerIs.fightersArraySaved {
                if fighter.category == Category.warrior {
                    let fighterInResetMode = Warrior(name: fighter.name, numberFetich: fighter.numberFetich)
                    playerIs.fightersArray.append(fighterInResetMode)
                }
                if fighter.category == Category.dwarf {
                    let fighterInResetMode = Dwarf(name: fighter.name, numberFetich: fighter.numberFetich)
                    playerIs.fightersArray.append(fighterInResetMode)
                }
                if fighter.category == Category.colossus {
                    let fighterInResetMode = Colossus(name: fighter.name, numberFetich: fighter.numberFetich)
                    playerIs.fightersArray.append(fighterInResetMode)
                }
                if fighter.category == Category.wizard {
                    let fighterInResetMode = Wizard(name: fighter.name, numberFetich: fighter.numberFetich)
                    playerIs.fightersArray.append(fighterInResetMode)
                }
            }
            // loop with this instance user and "var character" to show the team"
            print("\n\(playerIs.gamerName), voici ta team \(playerIs.teamName) remise sur pied !!!! ")
            for character in playerIs.fightersArray {
                print("\(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
            }
            playerIs = defenderIs
            pause()
        }
        print("\r\r\rUne nouvelle bataille peut maintenant commencer !!!!")
    }
    
}

