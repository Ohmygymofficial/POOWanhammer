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
            let user = Players(gamerName: Players.setPlayerName(), teamName: Players.setTeamName())
            playersArray.append(user)
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
            user.chooseFighterCategory()
            
            // loop with this instance user and "var character" to show the team"
            print("\n\(user.gamerName), voici ta team \(user.teamName):")
            for character in user.fightersArray {
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
        let defenderIs = playersArray[wichTeam + 1]
        
        print("Avec qui souhaites=-tu agir ?")
        var n = 1
        for character in attackerIs.fightersArray {
            print("Tape \(n) pour \(character.name) le \(character.category) avec \(character.weapon.nameOfWeapon) de puissance \(character.weapon.powerOfWeapon). PV = \(character.lifePoint)")
            n += 1
        }
        
        let attackerChoosen = attackerIs.chooseAttackerFrom(user: attackerIs)
        print("L'attaquant choisit est : \(attackerChoosen.name) le \(attackerChoosen.category)")
        
        
        // game.randomChest()
        
        // game.randomFetich()
        // game.chooseDefender()
        // game.bonusZone()
        
        
    }
    
    
    /**
     func randomChest() : Random Chest Appear and can change weapon of the attacker
 */
    func randomChest() {
        
        
       
    }
    
    
    
    
    // initialisation of RandomChest
    // initialisation of FetichZone
    // initialisation of BonusZone
    // Initialisation of Congrats
    // reset
    
    
    /**
     demoMode : To let the program choose User, team and Fighters
     */
    func demoMode() {
        print("ici le demo mode avec equipe auto")
    }
    
    
}

