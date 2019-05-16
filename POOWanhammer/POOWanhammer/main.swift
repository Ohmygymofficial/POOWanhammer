//
//  main.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

// Create an instance of Game class
let game = Game()

// var to go outside the program
var stayInProgram = true

// Welcome print introduction
game.welcome()

// Start the game
game.principalMenu()

if stayInProgram {
// When team are create by players, the fight start.
game.chooseAttackerFrom()
}



/*
 Player => Characters => attack
 Tu vas avoir dans ton main un tableau de player, tu auras un joueur au moment T, soit le premier soit le deuxieme. Le joueur au moment T va devoir choisir un Character de son tableau parmis les 3, il auras 3 choix en fonction de qui il veut choisir. Le character à une fonction qui lui permet d'attaquer ou de soigner suivant la classe.
 Tu l'as ton instance de ton character puisqu'elle sera dans ton tableau de characters de ton player.
 Si tu faisait ce que tu veux faire en gros tu utiliserais pas un characters quelconque mais n'importe quel characters qui serait prédéfinie puisque ce sera pas ton character qui attaquera mais ta classe.
 Faut vraiment que tu fasses les différences.
 Pour l'instant pas besoin de static dans tes classes, mise a part pour ta classe Tools car tu n'as pour le coup besoin d'aucune instance de cette classe, tu n'as aucune donnée a sauvegarder. Il te faut juste une String à un moment T qui tu donneras a player ou a character, mais ensuite cette donnée ne sera pas gardé et donc sera morte dans ton code, en quelque sorte supprimée.
 Mets tout en fonction normal et essaie de comprendre comme fonctionne les fonctions avec la POO
 */
