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
    
    // var fighterArray  VOIR AVEC LILIAN
    var fightersArray = [Fighter]()
    
    
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
                geek.initialize() // ask userName and teamName and chooseFighters
            case "2":
                print("Lâcheur ! 😜")
                stayInProgram = false //change BOOL to go outside loop of program
            case "3":
                geek.demoMode() //automatic choice of the userName, TeamName and Fighters
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
            let user = Players(gamerName: Others.giveGamerName(), teamName : Others.giveTeamName())
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
            Others.chooseFighterCategory()
        }
    }
    
    
    
    /**
     demoMode : To let the program choose User, team and Fighters
     */
    func demoMode() {
        print("ici le demo mode avec equipe auto")
    }
    
    
    // Initialisation of Battle
    // initialisation of RandomChest
    // initialisation of FetichZone
    // initialisation of BonusZone
    // Initialisation of Congrats
    // reset
    
}
