//
//  Ladder.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-16.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class Ladder : GameObject {
    override func onClick() {
        if !GVC.progress.tookLadder {
            addToInventory()
            GVC.progress.tookLadder = true
            showComment("A ladder is always good to have. I'll just take it and carry it around.")
        }
    }
}
