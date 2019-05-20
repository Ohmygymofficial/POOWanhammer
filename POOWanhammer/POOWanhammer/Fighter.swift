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
    var weapon = Weapon(nameOfWeapon: "une épée", powerOfWeapon: 10, weaponType: Weapon.WeaponType.sword)
    var special = Special.doubleAttack
    var lifePoint: Int = 100
    var bonusZone = Bonus(HistoryOfBonus: "", powerOfBonus: 0, bonusType: .randomBonusZone)
    
    
    // to archive all the fighter name and check is Unique
    static var allFighterName = [String]()
    
    
    init(name: String, numberFetich: Int) {
        self.name = name
        self.numberFetich = numberFetich
    }
    
    
    /**
     specialAttack : Nothing on mother Class
     */
    func specialAttack(attackerChoosen: Fighter, whoReceiveChoosen: Fighter, defenderIs: Players, attackerIs: Players) {}
    
    
    
    /**
     changeWeapon() : Fighter's have new weapon and new power
     */
    func changeWeapon(attackerChoosen: Fighter) -> Weapon {
        
        var newWeapon = Weapon(nameOfWeapon: "ChestSurprise", powerOfWeapon: 0, weaponType: .chestSurprise)
        
        // launch Damage Array
        let weaponChestContent = [
            Weapon(nameOfWeapon: "une épée dorée", powerOfWeapon: 15, weaponType: .goldSword),
            Weapon(nameOfWeapon: "une hâche de Rahan", powerOfWeapon: 25, weaponType: .rahanAxe),
            Weapon(nameOfWeapon: "une grenade", powerOfWeapon: 30, weaponType: .grenade),
            Weapon(nameOfWeapon: "un fléau d'arme", powerOfWeapon: 25, weaponType: .weaponFlail),
            Weapon(nameOfWeapon: "un tire-bouchon", powerOfWeapon: 5, weaponType: .corkscrew),
            ]
        
        // launch Heal Array
        let weaponHealContent = [
            Weapon(nameOfWeapon: "une purée de brocoli", powerOfWeapon: 15, weaponType: .broccoli),
            Weapon(nameOfWeapon: "une barre protéinée", powerOfWeapon: 25, weaponType: .proteinBar),
            Weapon(nameOfWeapon: "une whey à la banane", powerOfWeapon: 30, weaponType: .bananaWhey),
            Weapon(nameOfWeapon: "une framboise fraiche", powerOfWeapon: 25, weaponType: .raspberry),
            Weapon(nameOfWeapon: "un BigMac", powerOfWeapon: 5, weaponType: .bigMac),
            ]
        
        
        if attackerChoosen.category == Category.wizard {
            newWeapon = weaponHealContent[Int(arc4random_uniform(UInt32(weaponHealContent.count)))]
        } else {
            newWeapon = weaponChestContent[Int(arc4random_uniform(UInt32(weaponChestContent.count)))]
        }
        return newWeapon
    }
    
    
    /**
     takeBonusZone
     */
    func takeBonusZone(attackerChoosen: Fighter) -> Bonus {
        
        
        var resultbonusZone = Bonus(HistoryOfBonus: "", powerOfBonus: 0, bonusType: .randomBonusZone)
        
        let bonusZoneFighter = [
        Bonus(HistoryOfBonus: "prend confiance et envoit un autre coup puissant au ventre de ", powerOfBonus: 50, bonusType: .fBonus1),
        Bonus(HistoryOfBonus: "dans son élan d'attaque, ajoute un revers puissant en pleine figure de ", powerOfBonus: 60, bonusType: .fBonus2),
        Bonus(HistoryOfBonus: "énervé, prend appui sur un arbre, et envoi un coup fatal en pleine gorge de ", powerOfBonus: 90, bonusType: .fBonus3),
        Bonus(HistoryOfBonus: "utilise son courage pour ajouter une série de 6 coups de tête en plein nez de ", powerOfBonus: 60, bonusType: .fBonus4),
        Bonus(HistoryOfBonus: "nous fait un coup retourné supplémentaire en plein dos de ", powerOfBonus: 50, bonusType: .fBonus5),
        ]
        
        let bonusZoneWizard = [
            Bonus(HistoryOfBonus: "rassemble sa concentration et arrive à ajouter un sort de soin puissant pour ", powerOfBonus: 50, bonusType: .wBonus1),
            Bonus(HistoryOfBonus: "ajoute 2 mouvements spéciaux et envoi un soin pour ", powerOfBonus: 60, bonusType: .wBonus2),
            Bonus(HistoryOfBonus: "utilise sa dernière formule ! Un soin puissant est invoqué pour ", powerOfBonus: 90, bonusType: .wBonus3),
            ]
        
        if attackerChoosen.category == Category.wizard {
            resultbonusZone = bonusZoneWizard[Int(arc4random_uniform(UInt32(bonusZoneWizard.count)))]
        } else {
            resultbonusZone = bonusZoneFighter[Int(arc4random_uniform(UInt32(bonusZoneFighter.count)))]
        }
        return resultbonusZone

        
        
    }
    
    
    /**
     takeUnluckZone
     */
    func takeUnluckZone(attackerChoosen: Fighter) -> Bonus{
        
        
        var resultbonusZone = Bonus(HistoryOfBonus: "", powerOfBonus: 0, bonusType: .randomBonusZone)
        
        let bonusZoneFighter = [
            Bonus(HistoryOfBonus: "prend confiance et envoit un autre coup puissant .... mais il glisse et crée une blessure au ventre sur ", powerOfBonus: 50, bonusType: .fBonus1),
            Bonus(HistoryOfBonus: "dans son élan d'attaque, ajoute un revers puissant..mais il manque son coup et crée une blessure au bras sur ", powerOfBonus: 60, bonusType: .fBonus2),
            Bonus(HistoryOfBonus: "énervé, prend appui sur un arbre, pour envoyer un coup fatal en pleine gorge...mais l'arbre est glissant, il rate son attaque et crée une profonde blessure sur ", powerOfBonus: 90, bonusType: .fBonus3),
            Bonus(HistoryOfBonus: "utilise son courage pour ajouter des coups de tête...mais désorienté, il crée des blessures sur ", powerOfBonus: 60, bonusType: .fBonus4),
            Bonus(HistoryOfBonus: "nous fait un coup retourné supplémentaire ...son arme lui glisse des mains et il crée une entaille sur ", powerOfBonus: 50, bonusType: .fBonus5),
            ]
        
        let bonusZoneWizard = [
            Bonus(HistoryOfBonus: "rassemble sa concentration pour lancer un soin puissant...mais il est déconcentré et son soin est envoyé sur ", powerOfBonus: 50, bonusType: .wBonus1),
            Bonus(HistoryOfBonus: "ajoute 2 mouvements spéciaux pour soigner encore ! Mouvements râtés....les soins arrivent sur ", powerOfBonus: 60, bonusType: .wBonus2),
            Bonus(HistoryOfBonus: "utilise sa dernière formule ! Un soin puissant est invoqué! Mais la formule est pas la bonne... et elle soigne ", powerOfBonus: 90, bonusType: .wBonus3),
            ]
        
        if attackerChoosen.category == Category.wizard {
            resultbonusZone = bonusZoneWizard[Int(arc4random_uniform(UInt32(bonusZoneWizard.count)))]
        } else {
            resultbonusZone = bonusZoneFighter[Int(arc4random_uniform(UInt32(bonusZoneFighter.count)))]
        }
        return resultbonusZone

       
        
    }
    
    
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
    static func setNumberFetich(demo: Bool) -> Int {
        
        //in demo mode : give random Fetich Number
        if demo == true {
            return Int.random(in: 1..<5)
        }
        
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
