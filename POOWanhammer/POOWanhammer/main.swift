//
//  main.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

// to check if it's the first User Input
var firstUI = true

// Create an instance of Game class
let game = Game()


while game.stayInProgram {
    // When team are create by players, the fight start.
    game.fight()
}



