//
//  Characters.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Fighter { // by default, we choose Warrior
    
    var name : String
    var numberFetich : Int
    var category = Category.warrior
    var weapon = Weapon.sword
    var special = Special.doubleAttack
    var lifePoint: Int = 100
    var strenght: Int = 10
    
    // to archive all the fighter name and check is Unique
    static var allFighterName = [String]()
    
    
    init(name: String, numberFetich: Int) {
        self.name = name
        self.numberFetich = numberFetich
    }
 
    
    /**
     specialAttack : Nothing on mother Class
     */
    func specialAttack(_ whichTeam: Int?, _ damageInLoad: Int?, _ resultBonusToPrint: String?) {}
    
    
    
    
    /**
     nameOfTheFighter : Take all the fighter Name
     */
    static func nameOfTheFighter(category: Category) -> String {
        
        print("\r Quel est le doux prenom de ce \(category) ?")
        
        var nameOfFighterOk = ""
        if let nameOfFighter = readLine() {
            
            // check if already exist
            let isOk =  fighterAlreadyExist(what: nameOfFighter)
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
    static func setNumberFetich() -> Int {
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
     fighterAlreadyExist : Static func to check if one User Input already exist thanks to the return
     */
    static func fighterAlreadyExist(what : String) -> Bool {
        
        // peut être créer un tableau qui stocke les noms des fighters, toute team confondue, et compare en LOOP dedans ?
        
        // add one "" to initialize the array on the first User Input
        if game.firstUI {
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
    
    
    
    //func attack

    
    // func heal
    // func isDead
    
}
