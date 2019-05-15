//
//  Players.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Players {
    
    var gamerName : String
    var teamName : String
    static let numberOfFighters = 3
    var winCounter = 0
    var looseCounter = 0
    var lifeTeam = 0
    var symbol = "X"
    
    // var fighterArray  VOIR AVEC LILIAN
    var fightersArray = [Fighter]()
    
    
    init() {
        self.gamerName = setPlayerName()
        self.teamName = setTeamName()
    }
    
    
    /**
     setPlayerName : Take all the UserName
     */
    func setPlayerName() -> String {
        
        if game.firstUI {
            print("\r🔴 Joueur 1 : Quel est ton nom de Gamer ?")
        } else { print("\r🔵 Joueur 2 : Quel est ton nom de Gamer ?") }
        
        var pseudoOfGamerOk = ""
        if let pseudoOfGamer = readLine() {
            
            // check if already exist
            let isOk = userAlreadyExist(what: pseudoOfGamer)
            if isOk  { //
                print("Ce pseudo existe déjà ... ^^  On en choisit un autre ? ")
                return setPlayerName()
            }
            
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
            
            // check if already exist
            let isOk = teamAlreadyExist(what: teamOfGamer)
            if isOk  { //
                print("Cette TEAM existe déjà ... ^^  On en choisit une autre ? ")
                return setTeamName()
            }
            
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
    
    
    
    /**
     giveFighterName : Take all the UserName
     */
    func chooseFighterCategory() {
        while fightersArray.count < 3 { // to be sure that each team have 3 fighters
            if fightersArray.count == 2 {
                print("\r\rEt donc, quel sera ton dernier fighter ? ")
            } else {
                print("\r\rTu dois choisir \(3 - fightersArray.count) Fighters : ")
            }
            print("\n1. 🗡 Donne moi un \(Category.warrior.rawValue)"
                + "\n2. 👨‍🎤 Donne moi un \(Category.dwarf.rawValue)"
                + "\n3. 👹 Donne moi un \(Category.colossus.rawValue)"
                + "\n4. 🧙‍♀️ Donne moi un \(Category.wizard.rawValue)"
                + "\n5. 💻 Voir les caractéristiques des personnages")
            
            if let choiceMenu1 = readLine() {
                switch choiceMenu1 {
                case "1":
                    let fighterInLoad = Warrior()
                    fightersArray.append(fighterInLoad)
                case "2":
                    let fighterInLoad = Dwarf()
                    fightersArray.append(fighterInLoad)
                case "3":
                    let fighterInLoad = Colossus()
                    fightersArray.append(fighterInLoad)
                case "4":
                    if game.numberOfWizard >= 2 {
                        print("Désolé, vous ne pouvez pas choisir que des magiciens dans votre Team ;)")
                        return chooseFighterCategory()
                    }
                    let fighterInLoad = Wizard()
                    fightersArray.append(fighterInLoad)
                case "5":
                    FightersSettings()
                    pause()
                    return chooseFighterCategory()
                    
                default:
                    print("Je n'ai pas compris ton choix")
                    return chooseFighterCategory()
                }
            }
        }
    }
    
    
    
}




