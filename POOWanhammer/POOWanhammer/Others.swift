//
//  Others.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Others { // create to ask some static thing at users
    
    // to archive all the fighter name and check is Unique
    static var allFighterName = [String]()
    
    
    /**
     giveGamerName : Take all the UserName
     */
    static func giveGamerName() -> String {
        
        if geek.firstUI {
            print("\r🔴 Joueur 1 : Quel est ton nom de Gamer ?")
        } else { print("\r🔵 Joueur 2 : Quel est ton nom de Gamer ?") }
        
        var pseudoOfGamerOk = ""
        if let pseudoOfGamer = readLine() {
            
            // check if already exist
            let isOk =  userAlreadyExist(what: pseudoOfGamer)
            if isOk  { //
                print("Ce pseudo existe déjà ... ^^  On en choisit un autre ? ")
                return giveGamerName()
            }
            
            // Check if it's empty
            if pseudoOfGamer == ""  { //
                print("Vous devez choisir un nom de Gamer : Avec des lettres ;)")
                return giveGamerName()
            }
            
            // check if is not a INT  (VOIR AVEC LILIAN COMMENT VERIFIER QU'IL N'Y A PAS DE CHIFFRE DANS CETTE SAISIE
            //var isInt : Bool
            //if pseudoOfGamer == Int(pseudoOfGamer) {
            //   isInt = true
            //}
            
            // if the code can read this, is that the User Input is ok !
            pseudoOfGamerOk = pseudoOfGamer
        }
        return pseudoOfGamerOk
    }
    
    
    
    /**
     giveTeamName : Take all the Team Name
     */
    static func giveTeamName() -> String {
        
        print("\r Ton nom de TEAM ?")
        
        var teamOfGamerOk = ""
        if let teamOfGamer = readLine() {
            
            // check if already exist
            let isOk =  teamAlreadyExist(what: teamOfGamer)
            if isOk  { //
                print("Cette TEAM existe déjà ... ^^  On en choisit une autre ? ")
                return giveTeamName()
            }
            
            // Check if it's empty
            if teamOfGamer == ""  { //
                print("Vous devez choisir un nom de TEAM : Avec des lettres ;)")
                return giveTeamName()
            }
            // if the code can read this, is that the User Input is ok !
            teamOfGamerOk = teamOfGamer
        }
        return teamOfGamerOk
    }
    
    
    /**
     giveFighterName : Take all the UserName
     */
    static func chooseFighterCategory() {
        while geek.fightersArray.count < 3 { // to be sure that each team have 3 fighters
            if geek.fightersArray.count == 2 {
                print("\r\rEt donc, quel sera ton dernier fighter ? ")
            } else {
                print("\r\rTu dois choisir \(3 - geek.fightersArray.count) Fighters : ")
            }
            print("\n1. 🗡 Donne moi un \(Category.warrior.rawValue)"
                + "\n2. 👨‍🎤 Donne moi un \(Category.dwarf.rawValue)"
                + "\n3. 👹 Donne moi un \(Category.colossus.rawValue)"
                + "\n4. 🧙‍♀️ Donne moi un \(Category.wizard.rawValue)"
                + "\n5. 💻 Voir les caractéristiques des personnages")
            
            if let choiceMenu1 = readLine() {
                switch choiceMenu1 {
                case "1":
                    let fighterInLoad = Warrior(name: nameOfTheFighter(category: Category.warrior), numberFetich: numberFetich())
                    geek.fightersArray.append(fighterInLoad)
                case "2":
                    let fighterInLoad = Dwarf(name: nameOfTheFighter(category: Category.dwarf), numberFetich: numberFetich())
                    geek.fightersArray.append(fighterInLoad)
                case "3":
                    let fighterInLoad = Colossus(name: nameOfTheFighter(category: Category.colossus), numberFetich: numberFetich())
                    geek.fightersArray.append(fighterInLoad)
                case "4":
                    if geek.numberOfWizard >= 2 {
                        print("Désolé, vous ne pouvez pas choisir que des magiciens dans votre Team ;)")
                        return chooseFighterCategory()
                    }
                    let fighterInLoad = Wizard(name: nameOfTheFighter(category: Category.wizard), numberFetich: numberFetich())
                    geek.fightersArray.append(fighterInLoad)
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
        
        /**
         nameOfTheFighter : Take all the fighter Name
         */
        static func nameOfTheFighter(category: Category) -> String {
            
            print("\r Quel est le doux prenom de ce \(category) ?")
            
            var nameOfFighterOk = ""
            if let nameOfFighter = readLine() {
                
                // check if already exist
                let isOk =  Others.fighterAlreadyExist(what: nameOfFighter)
                if isOk  { //
                    print("Ce prenom de Fighter existe déjà ... ^^  On en choisit une autre ? ")
                    return nameOfTheFighter(category: category)
                }
                
                // Check if it's empty
                if nameOfFighter == ""  { //
                    print("Vous devez choisir un nom de Fighter avec des lettres ;)")
                    return nameOfTheFighter(category: category)
                }
                
                // if the code can read this, is that the User Input is ok !
                nameOfFighterOk = nameOfFighter
            }
            return nameOfFighterOk
        }
        
        
        /**
         numberFetich : ask FetichNumber of the fighter
         */
        static func numberFetich() -> Int {
            let numberTestOk = ""
            repeat { // repeat while var is empty
                print("Quel est ton numéro fétiche entre 1 et 5 ")
                if let numberTest = readLine() {
                    if let numberTestOk = Int(numberTest) { // check if it's Int
                        if numberTestOk > 0, numberTestOk < 6 {
                            return numberTestOk
                        } else { // if it's not 1 2 3 4 5  print this :
                            print("Le chiffre doit être supérieur à 0, et inférieur à 6")
                        }
                    } else { // if it's Int, so print :
                        print("Cela ne peut être qu'un numéro !")
                    }
                    
                } else {
                    print("Tu dois donner un numéro fétiche à ton Fighter dans la fonction numberTest ;)")
                }
            } while numberTestOk == ""
            return 1
        }
        
        
        
        
        /**
         userAlreadyExist : Static func to check if one User Input already exist thanks to the return
         */
        static func userAlreadyExist(what : String) -> Bool {
            
            
            if !geek.firstUI { //only if it's the second User Input
                // for the userName (compare to the user 1)
                if what.uppercased() == geek.playersArray[0].gamerName.uppercased() {
                    return true
                }
            }
            return false
        }
        
        
        /**
         teamAlreadyExist : Static func to check if one User Input already exist thanks to the return
         */
        static func teamAlreadyExist(what : String) -> Bool {
            
            
            if !geek.firstUI { //only if it's the second User Input
                // for the teamName (compare to the user 1)
                if what.uppercased() == geek.playersArray[0].teamName.uppercased() {
                    return true
                }
            }
            return false
        }
        
        /**
         fighterAlreadyExist : Static func to check if one User Input already exist thanks to the return
         */
        static func fighterAlreadyExist(what : String) -> Bool {
            
            // peut être créer un tableau qui stocke les noms des fighters, toute team confondue, et compare en LOOP dedans ?
            
            // add one "" to initialize the array on the first User Input
            if geek.firstUI {
                allFighterName.append("")
            }
            
            for eachFighter in allFighterName {
                if what.uppercased() == eachFighter.uppercased() {
                    return true
                }
            }
            // if it's OK : We add this one in the Array
            allFighterName.append(what)
            return false
        }
        
        
        
        /**
         FightersSettings : To print the caracteristic of the Fighters
         */
        static func FightersSettings() {
            print("Voici les caractéristiques des personnages :"
                + "\n 🗡 Le \(Category.warrior.rawValue): PV : 100, Dégâts : 10, spécial : Double Attaque"
                + "\n 👨‍🎤 Le \(Category.dwarf.rawValue) : PV : 80, Arme : Hâche, Dégâts : 20, spécial : Double Dégâts"
                + "\n 👹 Le \(Category.colossus.rawValue) : PV : 200, Dégâts : 5, spécial : Frayeur (Adversaire perd son tour)"
                + "\n 🧙‍♀️ Le \(Category.wizard.rawValue) : PV : 150, Soins : +15, spécial : FireBall dégâts 30")
        }
        
        
        /**
         pause : To make a pause in execution, and wait about touch press about user
         */
        static func pause() {
            
            print("Appuyer sur Entrer pour continuer..")
            _ = readLine()
            
        }
        
        
}

