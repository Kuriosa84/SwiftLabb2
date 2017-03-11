//
//  SafeLockTrialError.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-09.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation

class SafeLockTrialError {
    
    var correctSequence : [Int]
    var isCorrect : Bool
    var correctAnswers : Int
    
    init() {
        correctAnswers = 0
        isCorrect = true
        correctSequence = [3, 1, 5, 4, 0, 2]
    }
    
    func guess(_ button: Int) {
        if(button == correctSequence[correctAnswers]) {
            activateButton(button)
            correctAnswers += 1
            if(correctAnswers == correctSequence.count) {
                openSafe()
            }
        } else {
            deactivateButtons()
        }
    }
    
    func activateButton(_ button: Int) {
        //Make the button stay pressed
        //Change sprite to other sprite
    }
    
    func deactivateButtons() {
        //Make all the buttons unpressed
        //Change all the sprites of the buttons back
    }
    
    func openSafe() {
        //Kod för att öppna kassaskåpet...
        //Click sound
    }
    
}
