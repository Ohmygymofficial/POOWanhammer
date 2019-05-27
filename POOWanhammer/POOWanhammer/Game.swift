//
//  Game.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Game {
    //var players : [Players]
    var playersArray = [Players]()
    // var to go outside the program
    var stayInProgram = true
    // var to autorize demoMode
    var demo = false
    // var to know if the fighter have a bonus zone
    var bonusZone = false
    // var to know if the bonus Zone is luck or Unluck
    var bonusIsLuck = true
    // to check if it's the first User Input
    var firstUI = true
    
    init() {
        print("Bienvenue dans le WANHAMMER")
        start()
    }
    
    /**
     start : User have to choose : Play, Dont play, Demo mode
     */
    func start() {
        print("\rQue voulez vous faire ?"
            + "\n1. ▶ Entrer dans le WANHAMMER"
            + "\n2. ❌ Je ne veux pas me battre"
            + "\n3. Attribution auto des équipes")
        if let choiceMenu1 = readLine() {
            switch choiceMenu1 {
            case "1":
                // demoMode()
                createPlayersAndFighters() // ask userName and teamName and chooseFighters
            case "2":
                print("Lâcheur ! 😜")
                stayInProgram = false //change BOOL to go outside loop of program
            case "3":
                demo = true
                //demoMode()
                createPlayersAndFighters() // userName and teamName and chooseFighters
            default: print("Je n'ai pas compris votre choix.. tapez 1, 2 ou 3")
            }
        }
    }
    
    
    
    /**
     createPlayersAndFighters : Here User, teamName and Fighters will be choose
     */
    func createPlayersAndFighters() {
        
        /*  A SUPPRIMER APRES AVOIR VERIFIE ET SUPPRIMER L'ERREUR DU THREAD1
         // Initialisation of each team
         for n in 0...1 {
         let players = Players()
         playersArray.append(players)
         if firstUI {
         playersArray[n].symbol = "🔴"
         print("\(playersArray[n].symbol) \(playersArray[n].gamerName) : Tu entres dans le WanHammer avec ta TEAM \(playersArray[n].teamName)! Force à toi !")
         firstUI = false
         } else {
         playersArray[n].symbol = "🔵"
         print("\(playersArray[n].symbol) \(playersArray[n].gamerName) : Ta TEAM \(playersArray[n].teamName) va affronter \(playersArray[n - 1].gamerName) avec sa team \(playersArray[n - 1].teamName) ! Soit courageux ! ")
         }
         // Initialisation of each fighters
         print("\r Maintenant, il va falloir choisir qui entrent avec toi dans l'arène :")
         players.initializeFighter()
         
         // loop with this instance user and "var character" to show the team"
         print("\n\(players.gamerName), voici ta team \(players.teamName):")
         for character in players.fightersArray {
         print("\(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
         }
         // TEST
         Others.pause()
         }
         */
        
        var players = Players(gamerName: "", teamName: "")
        // Initialisation of each team
        for n in 0...1 {
            if demo {
                if firstUI {
                    players = Players(gamerName: "Erwan", teamName: "Wawan")
                    playersArray.append(players)
                    playersArray[n].symbol = "🔴"
                    players.initializeRandomFighterDemo1()
                    firstUI = false
                } else {
                    players = Players(gamerName: "Marine", teamName: "Cat")
                    playersArray.append(players)
                    playersArray[n].symbol = "🔵"
                    players.initializeRandomFighterDemo2()
                }
            } else {
                players = Players()
                playersArray.append(players)
                if firstUI {
                    playersArray[n].symbol = "🔴"
                    print("\(playersArray[n].symbol) \(playersArray[n].gamerName) : Tu entres dans le WanHammer avec ta TEAM \(playersArray[n].teamName)! Force à toi !")
                    firstUI = false
                } else {
                    playersArray[n].symbol = "🔵"
                    print("\(playersArray[n].symbol) \(playersArray[n].gamerName) : Ta TEAM \(playersArray[n].teamName) va affronter \(playersArray[n - 1].gamerName) avec sa team \(playersArray[n - 1].teamName) ! Soit courageux ! ")
                }
                // Initialisation of each fighters
                print("\r Maintenant, il va falloir choisir qui entrent avec toi dans l'arène :")
                players.initializeFighter()
            }
            
            // loop with this instance user and "var character" to show the team"
            print("\n\(players.gamerName), voici ta team \(players.teamName):")
            for character in players.fightersArray {
                print("\(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
            }
        }
        // PAUSE
        Others.pause()
    }
    
    
    
    
    /**
     fight() : The fight Begin here
     */
    func fight() {
        
        // initialisation of attacker
        var attackerIs = playersArray[0]
        // initialisation of defender / whoReceive the action
        var defenderIs = playersArray[1]
        
        //update TeamLifePoint
        Others.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
        while attackerIs.lifeTeam > 0 && defenderIs.lifeTeam > 0 {
            
            // print the attacker for make choice
            Others.printListOfAttacker(attackerIs: attackerIs)
            // attackerChoosen is the good fighter who give the action
            let attackerChoosen = attackerIs.chooseFighterAttack(attackerIs : attackerIs)
            print("L'attaquant choisit est : \(attackerChoosen.name) le \(attackerChoosen.category)")
            
            // initialisation of RandomChest
            // random chest appear or not 1/3 luck : Content depend of the category of the fighter
            let randomNumberChest = Int.random(in: 1..<4)
            if randomNumberChest == 1 {
                attackerChoosen.openRandomChest(attackerChoosen: attackerChoosen)
            }
            
            // print the defender for make choice
            Others.printListOfDefender(attackerIs: attackerIs, defenderIs: defenderIs, attackerChoosen: attackerChoosen)
            
            // whoReceiveChoosen is the fighter whoReceive The action
            let whoReceiveChoosen = defenderIs.chooseFighterDefend(defenderIs: defenderIs, attackerIs: attackerIs, attackerChoosen: attackerChoosen)
            print("Celui qui va recevoir l'action est : \(whoReceiveChoosen.name) le \(whoReceiveChoosen.category)")
            
            // distribution damage or care
            Others.updateCareOrDamage(attackerChoosen: attackerChoosen,whoReceiveChoosen: whoReceiveChoosen, defenderIs: defenderIs, attackerIs: attackerIs, bonusIsLuck: bonusIsLuck, bonusZone: bonusZone)
            
            // print result
            Others.printAction(attackerChoosen: attackerChoosen, whoReceiveChoosen: whoReceiveChoosen, bonusZone: bonusZone)
            
            //update TeamLifePoint
            Others.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
            
            
            // initialisation of FetichZone
            let randomFetichNumber = Int.random(in: 1..<6)
            if randomFetichNumber == attackerChoosen.numberFetich {
                attackerChoosen.useFetichNumber(attackerChoosen: attackerChoosen, whoReceiveChoosen: whoReceiveChoosen, defenderIs: defenderIs, attackerIs: attackerIs, bonusIsLuck: bonusIsLuck, bonusZone: bonusZone)
            }
            
            // initialisation of BonusZone
            let randomBonusZone = Int.random(in: 1..<3)
            if randomBonusZone == 1 {
                Others.checkTeamAreAlive(attackerIs: attackerIs, defenderIs: defenderIs)
                //launch unluck
                attackerChoosen.bonusZone = attackerChoosen.takeUnluckZone(attackerChoosen: attackerChoosen)
                bonusZone = true
                bonusIsLuck = false
                // distribution damage or care
                Others.updateCareOrDamage(attackerChoosen: attackerChoosen,whoReceiveChoosen: whoReceiveChoosen, defenderIs: defenderIs, attackerIs: attackerIs, bonusIsLuck: bonusIsLuck, bonusZone: bonusZone)
                //reset bonus zone var
                bonusZone = false
                bonusIsLuck = true
                
            } else if randomBonusZone == 2 {
                Others.checkTeamAreAlive(attackerIs: attackerIs, defenderIs: defenderIs)
                //launch bonus
                attackerChoosen.bonusZone = attackerChoosen.takeBonusZone(attackerChoosen: attackerChoosen)
                bonusZone = true
                bonusIsLuck = true
                // attackerChoosen.bonusZone = resultBonusZone
                // distribution damage or care
                Others.updateCareOrDamage(attackerChoosen: attackerChoosen,whoReceiveChoosen: whoReceiveChoosen, defenderIs: defenderIs, attackerIs: attackerIs, bonusIsLuck: bonusIsLuck, bonusZone: bonusZone)
                //reset bonus zone var
                bonusZone = false
                bonusIsLuck = true
                
            }
            
            askForRevenge(defenderIs: defenderIs, attackerIs: attackerIs)
            fight()
            // Switch the attacker and defender
            swap(&attackerIs, &defenderIs)
            
            
            
        }
        // Initialisation of Congrats
        Others.printFinalScore(defenderIs: defenderIs, attackerIs: attackerIs)
        // update counter of Win and Loose
        Others.updateCounterLooseAndWin(defenderIs: defenderIs, attackerIs: attackerIs)
        // revenge or stop ?
        askForRevenge(defenderIs: defenderIs, attackerIs: attackerIs)
        print("Proposer un reset avec revanche")
    }
    
    /**
     askForRevenge : Users can choice if they want to continu or stop the game
     */
    func askForRevenge(defenderIs: Players, attackerIs: Players) {
        print("\rUne petite revanche ?"
            + "\n1. ▶ Oui !"
            + "\n2. ❌ Non, on quitte le WanHammer")
        if let choiceMenu1 = readLine() {
            switch choiceMenu1 {
            case "1":
                Others.resetTeamForRevenge(defenderIs: defenderIs, attackerIs: attackerIs) // ask userName and teamName and chooseFighters
            case "2":
                print("Lâcheur ! 😜")
                stayInProgram = false //change BOOL to go outside loop of program
            default: print("Je n'ai pas compris votre choix.. tapez 1 ou 2")
            }
        }
    }
    
    
    
    /* MICHEL MICHEL  DEMO MODE PEUT ETRE SUPPRIME, REDUIT GRACE A LA VAR DEMO  juste a supprimer erreur de THREAD avec LILIAN
    /**
     demoMode: Fighter/teamName/UserName selected by the program
     */
    func demoMode() {
        
        var players = Players(gamerName: "", teamName: "")
        // Initialisation of each team
        for n in 0...1 {
            if demo {
                if firstUI {
                    players = Players(gamerName: "Erwan", teamName: "Wawan")
                    playersArray.append(players)
                    playersArray[n].symbol = "🔴"
                    players.initializeRandomFighterDemo1()
                    firstUI = false
                } else {
                    players = Players(gamerName: "Marine", teamName: "Cat")
                    playersArray.append(players)
                    playersArray[n].symbol = "🔵"
                    players.initializeRandomFighterDemo2()
                }
            } else {
                players = Players()
                playersArray.append(players)
                if firstUI {
                    playersArray[n].symbol = "🔴"
                    print("\(playersArray[n].symbol) \(playersArray[n].gamerName) : Tu entres dans le WanHammer avec ta TEAM \(playersArray[n].teamName)! Force à toi !")
                    firstUI = false
                } else {
                    playersArray[n].symbol = "🔵"
                    print("\(playersArray[n].symbol) \(playersArray[n].gamerName) : Ta TEAM \(playersArray[n].teamName) va affronter \(playersArray[n - 1].gamerName) avec sa team \(playersArray[n - 1].teamName) ! Soit courageux ! ")
                }
                // Initialisation of each fighters
                print("\r Maintenant, il va falloir choisir qui entrent avec toi dans l'arène :")
                players.initializeFighter()
            }
            
            // loop with this instance user and "var character" to show the team"
            print("\n\(players.gamerName), voici ta team \(players.teamName):")
            for character in players.fightersArray {
                print("\(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
            }
        }
        // PAUSE
        Others.pause()
    }
    
    
    
    
    */
    
    
    
    
    
    /*
     for n in 0...1 {
     // TEAM 1
     demo = true
     var gamer = Players(gamerName: "Erwan", teamName: "Wawan")
     gamer.symbol = "🔴"
     playersArray.append(gamer)
     // Initialisation of each fighters
     gamer.initializeRandomFighterDemo1()
     
     
     // loop with this instance user and "var character" to show the team"
     print("\n\(gamer.symbol) \(gamer.gamerName), voici ta team \(gamer.teamName):")
     for character in gamer.fightersArray {
     print("\(gamer.symbol) \(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
     }
     
     
     }
     
     // TEAM 1
     demo = true
     var gamer = Players(gamerName: "Erwan", teamName: "Wawan")
     gamer.symbol = "🔴"
     playersArray.append(gamer)
     // Initialisation of each fighters
     gamer.initializeRandomFighterDemo1()
     
     
     // loop with this instance user and "var character" to show the team"
     print("\n\(gamer.symbol) \(gamer.gamerName), voici ta team \(gamer.teamName):")
     for character in gamer.fightersArray {
     print("\(gamer.symbol) \(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
     }
     
     // TEAM 2
     gamer = Players(gamerName: "Marine", teamName: "Cat")
     gamer.symbol = "🔵"
     playersArray.append(gamer)
     // Initialisation of each fighters
     gamer.initializeRandomFighterDemo2()
     
     // loop with this instance user and "var character" to show the team"
     print("\n\(gamer.symbol) \(gamer.gamerName), voici ta team \(gamer.teamName):")
     for character in gamer.fightersArray {
     print("\(gamer.symbol) \(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
     }
     Others.pause()
     }
     */
    
    
    
    
}
