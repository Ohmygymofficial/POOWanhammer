//
//  Others.swift
//  POOWanhammer
//
//  Created by E&M Life Project on 10/05/2019.
//  Copyright © 2019 Erwan PASTE. All rights reserved.
//

import Foundation

class Others { // create to ask some static thing at users
    
    
    
    
    /**
     checkInt
     */
    static func checkInt() -> Int {
        
        print("JE SUIS EN TRAIN DE CODER POUR RECUPERER LE FIGHTER EN VERIFIANT LINDEX Etc")
        if let answer = readLine() {
            if let answerOk = Int(answer) { // check if it's Int
                return answerOk
            } else { // if it's Int, so print :
                print("Cela ne peut être qu'un numéro !")
            }
        }
        // return this method until is not INT
        return checkInt()
    }
    
    
    
    /**
     pause : To make a pause in execution, and wait about touch press about user
     */
    static func pause() {
        
        print("Appuyer sur Entrer pour continuer..")
        _ = readLine()
        
    }
}

