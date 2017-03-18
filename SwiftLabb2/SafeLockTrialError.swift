//
//  SafeLockTrialError.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-18.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation

class SafeLockTrialError {
    var correctGuesses : Int = 0
    let correctCombination = [3, 1, 5, 4, 6, 2]
    
    func guess(nr: Int) -> Bool {
        if correctGuesses >= correctCombination.count {
            return true
        }
        if nr == correctCombination[correctGuesses] {
            correctGuesses += 1
            return true
        } else {
            correctGuesses = 0
            return false
        }
    }
}
