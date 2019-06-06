//
//  Players.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Players {
    
    var gamerName = ""
    var teamName = ""
    let maxFighters = 3
    var winCounter = 0
    var looseCounter = 0
    var lifeTeam = 0
    var symbol = "X"
    var fightersArray = [Fighter]()
    var fightersArraySaved = [Fighter]()
    var numberOfWizard = 0
    // to check if it's the first User Input
    var firstUI = true

    
    // init 1 with method
    init(firstUI: Bool) {
        self.firstUI = firstUI
        self.gamerName = setPlayerName()
        self.teamName = setTeamName()
    }
    
    // init 2 : with a manual gamer and teamName
    init(gamerName: String, teamName: String) {
        self.gamerName = gamerName
        self.teamName = teamName
    }
    
    
    /**
     setPlayerName : Take all the UserName
     */
    func setPlayerName() -> String {
        
        if firstUI {
            print("\r🔴 Joueur 1 : Quel est ton nom de Gamer ?")
        } else {
            print("\r🔵 Joueur 2 : Quel est ton nom de Gamer ?")
        }
        var pseudoOfGamerOk = ""
        if let pseudoOfGamer = readLine() {
            
            /*
            // check if already exist
            let isOk = isGamerNameAlreadyExist(gamerName: pseudoOfGamer)
            if isOk  {
                print("Ce pseudo existe déjà ... ^^  On en choisit un autre ? ")
                return setPlayerName()
            }
 */
            
            // Check if it's empty
            if pseudoOfGamer == ""  { //
                print("Vous devez choisir un nom de Gamer : Avec des lettres ;)")
                return setPlayerName()
            }
            if pseudoOfGamer.rangeOfCharacter(from: .decimalDigits) != nil {
                print("Merci de ne saisir que des lettres :)")
                return setPlayerName()
            }
            // if the code can read this, is that the User Input is ok !
            pseudoOfGamerOk = pseudoOfGamer
            
        }
        return pseudoOfGamerOk
    }
    
    
    /**
     setTeamName : Take all the Team Name
     */
    func setTeamName() -> String {
        
        print("\r Ton nom de TEAM ?")
        var teamOfGamerOk = ""
        if let teamOfGamer = readLine() {

            /*
            // check if already exist
            let isOk = isTeamNameAlreadyExist(teamName: teamOfGamer)
            if isOk  { //
                print("Cette TEAM existe déjà ... ^^  On en choisit une autre ? ")
                return setTeamName()
            }
            */
            
            // Check if it's empty
            if teamOfGamer == ""  { //
                print("Vous devez choisir un nom de TEAM : Avec des lettres ;)")
                return setTeamName()
            }
            // if the code can read this, is that the User Input is ok !
            teamOfGamerOk = teamOfGamer
        }
        return teamOfGamerOk
    }
    
    
    /*
    /**
     isGamerNameAlreadyExist : func to check if one User Input already exist thanks to the return
     */
    func isGamerNameAlreadyExist(gamerName: String) -> Bool {
        
        if !firstUI { //only if it's the second User Input
            // for the userName (compare to the user 1)
            if gamerName.uppercased() == game.playersArray.first?.gamerName.uppercased() {
                return true
            }
        }
        return false
    }
 */
    
    
    /*
    /**
     isTeamNameAlreadyExist : func to check if one User Input already exist thanks to the return
     */
    func isTeamNameAlreadyExist(teamName: String) -> Bool {
        
        if !firstUI { //only if it's the second User Input
            // for the teamName (compare to the user 1)
            if teamName.uppercased() == game.playersArray.first?.teamName.uppercased() {
                return true
            }
        }
        return false
    }
 */
    
    
    /**
     initializeFighter : Initialize Fighter by Category (Name, and Number Fetich)
     */
    func initializeFighter() {
        
        while fightersArray.count < maxFighters { // use let declared to block at 3 fighters
            if fightersArray.count == 2 {
                print("\r\rEt donc, quel sera ton dernier fighter ? ")
            } else {
                print("\r\rTu dois choisir \(3 - fightersArray.count) Fighters : ")
            }
            var fighterInLoad = Fighter(name: "", numberFetich: 1)
            print("\n1. 🗡 Donne moi un \(Category.warrior.rawValue)"
                + "\n2. 👨‍🎤 Donne moi un \(Category.dwarf.rawValue)"
                + "\n3. 👹 Donne moi un \(Category.colossus.rawValue)"
                + "\n4. 🧙‍♀️ Donne moi un \(Category.wizard.rawValue)"
                + "\n5. 💻 Voir les caractéristiques des personnages")
            
            if let choiceMenu1 = readLine() {
                switch choiceMenu1 {
                case "1":
                    fighterInLoad = Warrior(firstUI: firstUI)
                    addFighterInArray(fighterInLoad: fighterInLoad)
                case "2":
                    let fighterInLoad = Dwarf(firstUI: firstUI)
                    addFighterInArray(fighterInLoad: fighterInLoad)
                case "3":
                    let fighterInLoad = Colossus(firstUI: firstUI)
                    addFighterInArray(fighterInLoad: fighterInLoad)
                case "4":
                    if numberOfWizard >= 2 {
                        print("Désolé, vous ne pouvez pas choisir que des magiciens dans votre Team ;)")
                        return initializeFighter()
                    }
                    numberOfWizard += 1
                    let fighterInLoad = Wizard(firstUI: firstUI)
                    addFighterInArray(fighterInLoad: fighterInLoad)
                case "5":
                    fighterInLoad.fightersSettings()
                    print("Appuyer sur Entrer pour continuer..")
                    _ = readLine()
                    return initializeFighter()
                    
                default:
                    print("Je n'ai pas compris ton choix")
                    return initializeFighter()
                }
            }
        }
    }
    
    
    /**
     addFighterInArray
     */
    func addFighterInArray(fighterInLoad : Fighter) {
        fightersArray.append(fighterInLoad)
        fightersArraySaved.append(fighterInLoad)
    }
    
    
    /**
     initializeRandomFighterDemo1() : To give Demo Fighter for team 1
     */
    func initializeFighterDemo1() {
        
        let fighterDemo1 = Warrior(name: "Casius", numberFetich: 1)
        fightersArray.append(fighterDemo1)
        fightersArraySaved.append(fighterDemo1)
        
        let fighterDemo2 = Dwarf(name: "Kulk", numberFetich: 2)
        fightersArray.append(fighterDemo2)
        fightersArraySaved.append(fighterDemo2)
        
        let fighterDemo3 = Colossus(name: "BouL", numberFetich: 3)
        fightersArray.append(fighterDemo3)
        fightersArraySaved.append(fighterDemo3)
    }
    
    
    /**
     initializeRandomFighterDemo2() : To give Demo Fighter for team 2
     */
    func initializeFighterDemo2() {
        
        let fighterDemo1 = Wizard(name: "Mayou", numberFetich: 5)
        fightersArray.append(fighterDemo1)
        fightersArraySaved.append(fighterDemo1)
        
        let fighterDemo2 = Warrior(name: "Minnosh", numberFetich: 4)
        fightersArray.append(fighterDemo2)
        fightersArraySaved.append(fighterDemo2)
        
        let fighterDemo3 = Colossus(name: "Tenshu", numberFetich: 3)
        fightersArray.append(fighterDemo3)
        fightersArraySaved.append(fighterDemo3)
    }
    
    
    /**
     chooseFighterAttack(): Who give the attack
     */
    func chooseFighterAttack(attackerIs: Players) -> Fighter {
        
        // take a temporary value for the fighter
        var whoAttack = Fighter(name: "", numberFetich: 1)
        // to make sure that user input is not empty
        var answer = 0
        
        repeat {
            answer = game.checkInt()
            // to be on the good index
            answer -= 1
            // Check if choice exist in the Player Array
            if attackerIs.fightersArray.indices.contains(answer) {
                whoAttack = attackerIs.fightersArray[answer]
                // if not
            } else {
                print("Saisir un chiffre proposé, merci !")
            }
        } while !attackerIs.fightersArray.indices.contains(answer) || answer == -1
        return whoAttack
    }
    
    
    /**
     printListOfAttacker() : Print List of attacker
     */
    func printListOfAttacker(attackerIs: Players) {
        print("\r\r\(attackerIs.gamerName) (PV:\(attackerIs.lifeTeam)): Avec qui souhaites-tu agir ?")
        var n = 1
        for character in attackerIs.fightersArray {
            print("Tape \(n) pour choisir \(attackerIs.symbol)\(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
            n += 1
        }
    }
    
    
    /**
     chooseFighterDefend() : Who defend
     */
    func chooseFighterDefend(defenderIs : Players, attackerIs : Players, attackerChoosen: Fighter) -> Fighter {
        
        // take a temporary value for the fighter
        var whoReceiveChoosen = Fighter(name: "", numberFetich: 1)
        // take a temporary value for the Player
        var gamer = Players(gamerName: "", teamName: "")
        // to make sure that user input is not empty
        var answer = 0
        
        // condition to check in Defender Array or Attacker Array = IF IT'S A WIZARD
        if attackerChoosen.category != Category.wizard {
            gamer = defenderIs
        } else {
            gamer = attackerIs
        }
        
        repeat {
            answer = game.checkInt()
            // to be on the good index
            answer -= 1
            // Check if choice exist in the Player Array
            if gamer.fightersArray.indices.contains(answer) {
                whoReceiveChoosen = gamer.fightersArray[answer]
                // if not
            } else {
                print("Saisir un chiffre proposé, merci !")
            }
        } while !gamer.fightersArray.indices.contains(answer) || answer == -1
        return whoReceiveChoosen
    }
    
    
    /**
     printListOfDefender() : Print List of attacker
     */
    func printListOfDefender(attackerIs: Players,defenderIs: Players, attackerChoosen: Fighter) {
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
     updateTeamLifePointAndArray : To Update lifePoint and remove Dead Fighter
     */
    func updateTeamLifePointAndArray(defenderIs: Players, attackerIs: Players) {
        
        //Update Array AND REMOVE dead fighter
        var i = 0
        for fighter in defenderIs.fightersArray {
            if fighter.lifePoint <= 0 {
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t☠☠☠ WOOWWWW : Le fighter \(fighter.name) va être sorti du tableau car il est mort ! ☠☠☠")
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
     checkTeamAreAlive : check if a team is Dead
     */
    func checkTeamAreAlive(attackerIs: Players, defenderIs: Players) {
        
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
     updateCounterLooseAndWin : To update score of each Gamer Team
     */
    func updateCounterLooseAndWin(defenderIs: Players, attackerIs: Players) {
        
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
    func resetTeamForRevenge(defenderIs: Players, attackerIs: Players) {
        
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
            print("💚💚💚💚💚💚💚💚💚💚💚💚💚💚")
            print("\n\(playerIs.symbol) \(playerIs.gamerName), voici ta team \(playerIs.teamName) remise sur pied !!!! ")
            for character in playerIs.fightersArray {
                print("\(playerIs.symbol) \(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
            }
            updateTeamLifePointAndArray(defenderIs: playerIs, attackerIs: attackerIs)
            playerIs = defenderIs
            game.makePause()
        }
        updateTeamLifePointAndArray(defenderIs: playerIs, attackerIs: attackerIs)
        print("\r\r\rUne nouvelle bataille peut maintenant commencer !!!!")
    }
}




