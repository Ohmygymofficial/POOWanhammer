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
    
    
    // to check if it's the first User Input
    var firstUI = true
    
    // to switch team one or team two
    var wichTeam = 0
    
    // var to autorize demoMode
    var demo = false
    
    
    
    /**
     welcome : Say Hello to the Users
     */
    func welcome() {
        print("Bienvenue dans le WANHAMMER")
    }
    
    
    
    /**
     principalMenu : User have to choose : Play, Dont play, Demo mode
     */
    func principalMenu() {
        print("\rQue voulez vous faire ?"
            + "\n1. ▶ Entrer dans le WANHAMMER"
            + "\n2. ❌ Je ne veux pas me battre"
            + "\n3. Attribution auto des équipes")
        if let choiceMenu1 = readLine() {
            switch choiceMenu1 {
            case "1":
                game.initialize() // ask userName and teamName and chooseFighters
            case "2":
                print("Lâcheur ! 😜")
                stayInProgram = false //change BOOL to go outside loop of program
            case "3":
                game.demoMode() //automatic choice of the userName, TeamName and Fighters
            default: print("Je n'ai pas compris votre choix.. tapez 1, 2 ou 3")
            }
        }
    }
    
    
    
    /**
     initialize : Here User, teamName and Fighters will be choose
     */
    func initialize() {
        
        // Initialisation of each team
        for n in 0...1 {
            let gamer = Players(gamerName: Players.setPlayerName(), teamName: Players.setTeamName())
            playersArray.append(gamer)
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
            gamer.initializeFighter()
            
            // loop with this instance user and "var character" to show the team"
            print("\n\(gamer.gamerName), voici ta team \(gamer.teamName):")
            for character in gamer.fightersArray {
                print("\(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
            }
            // TEST
            Others.pause()
        }
    }
    
    
    
    
    
    
    /**
     fight() : The fight Begin here
     */
    func fight() {
        //choose the good Team attacker and defender
        let attackerIs = playersArray[wichTeam]
        
        print("Avec qui souhaites=-tu agir ?")
        var n = 1
        for character in attackerIs.fightersArray {
            print("Tape \(n) pour choisir \(attackerIs.symbol)\(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
            n += 1
        }
        // we take the Attacker
        let attackerChoosen = attackerIs.chooseFighter(gamer: attackerIs)
        print("L'attaquant choisit est : \(attackerChoosen.name) le \(attackerChoosen.category)")
        
        
        // random chest appear or not 1/5 luck : Content depend of the category of the fighter
        let randomNumberChest = Int.random(in: 1..<5)
        if randomNumberChest == 1 {
            print("😇😇😇😇 WAOOOW ! Un coffre est tombé devant toi !!😇😇😇😇")
            Others.pause()
            print("Tu avais \(attackerChoosen.weapon.nameOfWeapon)")
            let newWeapon = attackerChoosen.changeWeapon(attackerChoosen: attackerChoosen)
            attackerChoosen.weapon = newWeapon
            print("Tu t'équipes maintenant d'\(attackerChoosen.weapon.nameOfWeapon)")
            print("Ta puissance d'action est passée à : \(attackerChoosen.weapon.powerOfWeapon)")
            Others.pause()
        }
            
            // game.chooseDefender()
            var whoReceiveAction = playersArray[wichTeam + 1]
            var healOrAttack = "attaquer"
            if attackerChoosen.category != Category.wizard {
                print("Qui souhaites-tu attaquer ?")
            } else {
                print("Qui souhaites-tu guérir ?")
                whoReceiveAction = playersArray[wichTeam]
                healOrAttack = "soigner"
            }
        
        n = 1
        for character in whoReceiveAction.fightersArray {
            print("Tape \(n) pour \(healOrAttack) \(whoReceiveAction.symbol)\(character.name) le \(character.category). PV = \(character.lifePoint)")
            n += 1
        }
        
        // we take the fighter whoReceive The action
        let whoReceiveChoosen = whoReceiveAction.chooseFighter(gamer: whoReceiveAction)
        print("Celui qui va recevoir l'action est : \(whoReceiveChoosen.name) le \(whoReceiveChoosen.category)")
        
        
        
        
        }
        
        
        
        // game.randomFetich()
        // game.bonusZone()
        

    
    

    
    
    
    
    // initialisation of RandomChest
    // initialisation of FetichZone
    // initialisation of BonusZone
    // Initialisation of Congrats
    // reset
    
    
    /**
     demoMode: Fighter/teamName/UserName selected by the program
     */
    func demoMode() {

        
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


}
