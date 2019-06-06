//
//  Characters.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Fighter { // by default, we choose Warrior
    
    var name = ""
    var numberFetich = 0
    var category = Category.warrior
    var weapon = Weapon(nameOfWeapon: "une épée", powerOfWeapon: 10, weaponType: Weapon.WeaponType.sword)
    var special = Special.doubleAttack
    var lifePoint: Int = 100
    var bonusZone = Bonus(HistoryOfBonus: "", powerOfBonus: 0, bonusType: .randomBonusZone)
    var firstUI = true
    // Static to archive all the fighter name and check is Unique
    static var allFighterName = [String]()
    
    
    // init 1 with method
    init(firstUI: Bool) {
        self.firstUI = firstUI
    }
    
    // init 2 :
    init(name: String, numberFetich: Int) {
        self.name = name
        self.numberFetich = numberFetich
    }
    
    
    /**
     nameOfTheFighter : Take all the fighter Name
     */
    func nameOfTheFighter(category: Category) -> String {
        
        var nameOfFighterOk = ""
        
        // normal mode
        print("\r Quel est le doux prenom de ce \(category.rawValue) ?")
        if let nameOfFighter = readLine() {
            
            // Check if it's empty
            if nameOfFighter == ""  { //
                print("Vous devez choisir un nom de Fighter ;)")
                return nameOfTheFighter(category: category)
            }
            
            // check if already exist
            let isOk =  isFighterAlreadyExist(what: nameOfFighter)
            if isOk  { //
                print("Ce prenom de Fighter existe déjà ... ^^  On en choisit une autre ? ")
                return nameOfTheFighter(category: category)
            }
            
            // if the code can read this, is that the User Input is ok !
            nameOfFighterOk = nameOfFighter
        }
        return nameOfFighterOk
    }
    
    /**
     isFighterAlreadyExist : Static func to check if one User Input already exist thanks to the return
     */
    func isFighterAlreadyExist(what: String) -> Bool {
        
        for eachFighter in Fighter.allFighterName {
            if what.uppercased() == eachFighter.uppercased() {
                return true
            }
        }
        // if it's OK : We add this one in the Array
        Fighter.allFighterName.append(what)
        return false
    }
    
    
    /**
     numberFetich : ask FetichNumber of the fighter
     */
    func setNumberFetich(demo: Bool) -> Int {
        
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
     FightersSettings : To print the caracteristic of the Fighters
     */
    func fightersSettings() {
        print("\n\n Voici les caractéristiques des personnages :"
            + "\n 🗡 Le \(Category.warrior.rawValue): PV : 100, Dégâts : 10, spécial : Double Attaque"
            + "\n 👨‍🎤 Le \(Category.dwarf.rawValue) : PV : 80, Arme : Hâche, Dégâts : 20, spécial : Double Dégâts"
            + "\n 👹 Le \(Category.colossus.rawValue) : PV : 200, Dégâts : 5, spécial : Frayeur (Adversaire perd son tour)"
            + "\n 🧙‍♀️ Le \(Category.wizard.rawValue) : PV : 150, Soins : +15, spécial : FireBall dégâts 30")
    }
    
    
    /**
     func openRandomChest() : to take new weapon in random Chest when is appear
     */
    func openRandomChest(attackerChoosen: Fighter) {
        
        
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t😇😇😇😇 WAOOOW ! Un coffre est tombé devant toi !!😇😇😇😇")
        game.makePause()
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTu avais \(attackerChoosen.weapon.nameOfWeapon)")
        let oldValue = attackerChoosen.weapon.powerOfWeapon
        let newWeapon = attackerChoosen.changeWeapon(attackerChoosen: attackerChoosen)
        attackerChoosen.weapon = newWeapon
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTu t'équipes maintenant d'\(attackerChoosen.weapon.nameOfWeapon)")
        compareNewAndOldWeaponStrength(newValue: newWeapon.powerOfWeapon, oldValue: oldValue)
        game.makePause()
    }
    
    
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
     compareNewAndOldWeaponStrength() : To print different message depend of the new Strength of Weapon
     */
    func compareNewAndOldWeaponStrength(newValue: Int, oldValue: Int) {
        
        if oldValue > newValue {
            print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTa puissance d'action est descendue à : \(newValue)")
        } else if oldValue < newValue {
            print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTa puissance d'action est montée à : \(newValue)")
        } else {
            print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tLa valeur de ton arme est restée identique")
        }
    }
    
    
    /**
     func useFetichNumber() : to use Fetich Action
     */
    func useFetichNumber(attackerChoosen: Fighter, whoReceiveChoosen: Fighter, defenderIs: Players, attackerIs: Players, bonusIsLuck: Bool, bonusZone: Bool) {
        //check if one team is dead
        defenderIs.checkTeamAreAlive(attackerIs: attackerIs, defenderIs: defenderIs)
        
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t😍😍😍😍 FETICH TIME ! C'est ton jour de chance !!😍😍😍😍")
        print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTon \(attackerChoosen.category.rawValue) utilise sa \(attackerChoosen.special.rawValue)")
        attackerChoosen.specialAttack(attackerChoosen: attackerChoosen, whoReceiveChoosen: whoReceiveChoosen, defenderIs: defenderIs, attackerIs: attackerIs, bonusIsLuck: bonusIsLuck, bonusZone: bonusZone)
        //update TeamLifePoint
        defenderIs.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
    }
 
    
    /**
     specialAttack : Nothing on mother Class
     */
    func specialAttack(attackerChoosen: Fighter, whoReceiveChoosen: Fighter, defenderIs: Players, attackerIs: Players, bonusIsLuck: Bool, bonusZone: Bool) {
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
     updateCareOrDamage : To update lifePoint of the good fighter (depend of the action)
     */
    func updateCareOrDamage(attackerChoosen: Fighter,whoReceiveChoosen: Fighter, defenderIs: Players, attackerIs: Players, bonusIsLuck: Bool, bonusZone: Bool) {
        
        // var powerOfTheAction : Depend of "Weapon Strenght" if it's a normal action
        var powerOfTheAction = attackerChoosen.weapon.powerOfWeapon
        
        // depend If the Attacker have a Bonus zone
        if bonusZone == true {
            print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t 🅱🅱🅱 BONUS ZONE 🅱🅱🅱!!!!!")
            powerOfTheAction = attackerChoosen.bonusZone.powerOfBonus
            // and the fighter who receive the action depend of the result of bonusIsLuck
            if bonusIsLuck == true { //if is lucky
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t LUCKY DAY !!!!!")
                if attackerChoosen.category != Category.wizard { // for Fighters : give Damage to a random opponent fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(defenderIs.fightersArray.count)))
                    defenderIs.fightersArray[randomFighterIs].lifePoint -= powerOfTheAction
                    // print result
                    game.printAction(attackerChoosen: attackerChoosen, whoReceiveChoosen: defenderIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
                    //update TeamLifePoint
                    defenderIs.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
                } else { // for wizard : Add powerOfTheAction to a random Team Fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(attackerIs.fightersArray.count)))
                    attackerIs.fightersArray[randomFighterIs].lifePoint += powerOfTheAction
                    // print result
                    game.printAction(attackerChoosen: attackerChoosen, whoReceiveChoosen: attackerIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
                    //update TeamLifePoint
                    attackerIs.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
                }
            } else {   //if is UNlucky
                print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t 🤬🤬🤬 UNLUCKY BAD DAY 🤬🤬🤬!!!!!")
                if attackerChoosen.category != Category.wizard { // for Fighters : give Damage to a random TEAM fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(attackerIs.fightersArray.count)))
                    attackerIs.fightersArray[randomFighterIs].lifePoint -= powerOfTheAction
                    // print result
                    game.printAction(attackerChoosen: attackerChoosen, whoReceiveChoosen: attackerIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
                    //update TeamLifePoint
                    attackerIs.updateTeamLifePointAndArray(defenderIs: attackerIs, attackerIs: attackerIs)
                    
                } else { // for wizard : Add powerOfTheAction to a random opponent Fighter
                    let randomFighterIs = Int(arc4random_uniform(UInt32(defenderIs.fightersArray.count)))
                    defenderIs.fightersArray[randomFighterIs].lifePoint += powerOfTheAction
                    // print result
                    game.printAction(attackerChoosen: attackerChoosen, whoReceiveChoosen: defenderIs.fightersArray[randomFighterIs], bonusZone: bonusZone)
                    //update TeamLifePoint
                    defenderIs.updateTeamLifePointAndArray(defenderIs: defenderIs, attackerIs: attackerIs)
                }
            }
        } else { // IF BONUS ZONE IS FALSE
            if attackerChoosen.category != Category.wizard {
                whoReceiveChoosen.lifePoint -= attackerChoosen.weapon.powerOfWeapon
                // give 0 value if the fighter is dead (no negative count)
                if whoReceiveChoosen.lifePoint <= 0 {
                    print("\r\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t☠☠☠ WOWWWW LE WANHAMMER SE REDUIT : \(whoReceiveChoosen.name) est mort !☠☠☠")
                    whoReceiveChoosen.lifePoint = 0
                }
            } else {
                whoReceiveChoosen.lifePoint += attackerChoosen.weapon.powerOfWeapon
            }
        }
    }
}
