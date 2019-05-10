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
    
    // var fightersArray : [Characters]
    
    // init(name: Tools.giveName)
    init(gamerName: String, teamName: String) {
        self.gamerName = gamerName
        self.teamName = teamName
    }
    
    // create Team
    static func createTeam() {
        
        // create Gamer
        var pseudoOfGamerOk = ""
        var nameOfTeamOk = ""
        repeat {
            Tools.giveGamerName1()
            if let pseudoOfGamer = readLine(), pseudoOfGamer != "" {
                pseudoOfGamerOk = String(pseudoOfGamer)
            }
        } while pseudoOfGamerOk == ""
        // MICHEL MICHEL inserer le TeamName func
        
        
        repeat {
            Tools.giveTeamName1()
            if let nameOfTeam = readLine(), nameOfTeam != "" {
                nameOfTeamOk = String(nameOfTeam)
            }
        } while nameOfTeamOk == ""
        
        let team1 = Players(gamerName: pseudoOfGamerOk, teamName: nameOfTeamOk)
        Tools.welcome1(gamerName: team1.gamerName)
        Tools.pause()
        
        // same things for the team 2
        repeat {
            Tools.giveGamerName2()
            if let pseudoOfGamer = readLine(), pseudoOfGamer != "" {
                pseudoOfGamerOk = String(pseudoOfGamer)
                if pseudoOfGamerOk == team1.gamerName.lowercased() {
                    print("Ce Pseudo est déjà utilisé, merci d'en choisir un autre")
                }
            }
        } while pseudoOfGamerOk == "" || pseudoOfGamerOk == team1.gamerName.lowercased()
        
        repeat {
            Tools.giveTeamName2()
            if let nameOfTeam = readLine(), nameOfTeam != "" {
                nameOfTeamOk = String(nameOfTeam)
            }
        } while nameOfTeamOk == ""
        
        
        let team2 = Players(gamerName: pseudoOfGamerOk, teamName: nameOfTeamOk)
        Tools.welcome2(gamerName: team2.gamerName)
        Tools.pause()
        
        
    }
    // choose Characters
    
    
}

