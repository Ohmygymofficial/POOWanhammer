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
    var category = Category.warrior.rawValue
    var weapon: String = Weapon.sword.rawValue
    var special: String = Special.doubleAttack.rawValue
    var lifePoint: Int = 100
    var strenght: Int = 10

    
    init(category: Category) {
        self.name = nameOfTheFighter(category: category)
        self.numberFetich = numberFetich()
    }
 
    
    /**
     specialAttack : Nothing on mother Class
     */
    func specialAttack(_ whichTeam: Int?, _ damageInLoad: Int?, _ resultBonusToPrint: String?) {}
    
    
    
    
    /**
     nameOfTheFighter : Take all the fighter Name
     */
    func nameOfTheFighter(category: Category) -> String {
        
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
    func numberFetich() -> Int {
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
    

    
    
    
    
    //func attack
    // func heal
    // func isDead
    
}
