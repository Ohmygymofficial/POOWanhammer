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
    var playersArray : [Players]
    
    
    init(playersArray: [Players]) {
        self.playersArray = playersArray
    }
    
    // Initialisation of each team
    static func createPlayers() {
            Players.createTeam()
    }
    // Initialisation of Battle
    // initialisation of RandomChest
    // initialisation of FetichZone
    // initialisation of BonusZone
    // Initialisation of Congrats

}
