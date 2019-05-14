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
    
    /*
 init(playersArray: [Players]) {
        self.playersArray = playersArray
    }
 */
    
    func welcome() {
        print("Welcome à tous et blablabla de fou")
    }
    
    func initialize() {
        // Initialisation of each team
        for n in 0...1 {
            let user = Players(gamerName: Tools.giveGamerName(), teamName : Tools.giveTeamName())
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
            
            
            
        }
        
        
        
    }
    // Initialisation of Battle
    // initialisation of RandomChest
    // initialisation of FetichZone
    // initialisation of BonusZone
    // Initialisation of Congrats
    // reset
    
}
