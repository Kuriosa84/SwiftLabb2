//
//  goldKey.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-16.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class GoldKey : GameObject {
    override func onClick() {
        addToInventory()
        GVC.progress.tookGoldKey = true
        showComment("This has to be the key to the door so that I can get out of here... right?")
    }
}
