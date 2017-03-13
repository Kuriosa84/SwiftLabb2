//
//  ColourSafeLock.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-13.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation

class ColourSafeLock {
    var colours : [Colours] = [.white, .black, .red, .blue, .yellow, .green]
    let correctCombination : [Colours] = [.green, .white, .red]
    var currentGuess : [Colours]
    
    init() {
        currentGuess = [.white, .white, .white]
    }
    
    func isCorrectCombination() -> Bool {
        for (i, _) in self.currentGuess.enumerated() {
            if currentGuess[i] != correctCombination[i] {
                return false
            }
        }
        return true
    }
    
    func changeColour(nr: Int) {
        let newColourInt = (currentGuess[nr].rawValue + 1) % colours.count
        currentGuess[nr] = colours[newColourInt]
    }
}

enum Colours : Int{
    case white = 0, black, red, blue, yellow, green
}
