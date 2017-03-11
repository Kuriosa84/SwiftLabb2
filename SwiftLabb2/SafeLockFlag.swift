//
//  SafeLockFlag.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-09.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import UIKit

class SafeLockFlag {
    enum Colours {
        case black
        case blue, green, red, white, yellow
    }
    var colours : [Colours] = [.black, .blue, .green, .red, .white, .yellow]
    var currentCombination : [Colours]
    var correctCombination : [Colours] = [.green, .white, .red]
    
    init() {
        currentCombination = [.black, .black, .black]
    }
    
    func changeColour(button: Int) {
        
        //currentCombination[button]
    }
    
    func checkCombination() {
        var correct = true
        for (i, _) in currentCombination.enumerated() {
            if !(currentCombination[i] == correctCombination[i]) {
                correct = false
            }
        }
        if correct {
            openSafe()
        }
    }
    
    func openSafe() {
        
    }
    
    class Button {
        
    }
}
