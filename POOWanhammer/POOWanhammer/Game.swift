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
    
    // check numberOfWizard
    var numberOfWizard = 0
    
    
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
                print("\(character.name) le \(character.category) avec \(character.weapon.rawValue) de puissance \(character.strenght). PV = \(character.lifePoint)")
            }
            // TEST
            Others.pause()

        }
    }
    
    
    
    /**
     chooseAttackerFrom() : Who give the attack
     */
    
    func chooseAttackerFrom() {

        print("Ici j'essaye d'accéder aux objets ainsi créé :")
        print("Pour cela, l'instance user éphémère ayant été supprimé, en ayant au préalable stocké la TEAM dans les playersArray, et les Fighters dans le FighterArray (paramètres de PLAYER), ALORS, je dois utiliser une nouvelle variable/constate pour rappeler le playerArray !! Let's test !!")
        let attackerIs = playersArray[0]
        let defenderIs = playersArray[1]
 
        Others.pause()
        print("Ici les attaquants :")
        for character in attackerIs.fightersArray {
            print("\(character.name) le \(character.category) avec \(character.weapon.rawValue) de puissance \(character.strenght). PV = \(character.lifePoint)")
        }
        
        Others.pause()
        print("Ici les defenseurs :")
        for character in defenderIs.fightersArray {
            print("\(character.name) le \(character.category) avec \(character.weapon.rawValue) de puissance \(character.strenght). PV = \(character.lifePoint)")
        }
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
