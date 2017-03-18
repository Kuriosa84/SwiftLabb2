//
//  tealKey.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-16.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class TealKey : GameObject {
    override func onClick() {
        if markedInventoryItem is Ladder {
            addToInventory()
            GVC.progress.tookTealKey = true
            showComment("Yes! I got the key! Maybe I will get out of here!")
        } else {
            showComment("There's a key there, but I can't reach it!")
        }
    }
}
