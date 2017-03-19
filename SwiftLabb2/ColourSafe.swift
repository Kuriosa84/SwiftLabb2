//
//  ColourSafe.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-16.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class ColourSafe : GameObject {
    
    override func onClick() {
        if !GVC.progress.openedColourSafe {
            openNewScene(name: "ColourSafeCloseUp")
        } else if !GVC.progress.tookGoldKey {
            showComment("There is a gold key in the safe. I should take it.")
        } else {
            showComment("There is nothing else in the safe.")
        }
    }
}
