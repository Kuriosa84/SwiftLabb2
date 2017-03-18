//
//  Shelf.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-16.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class Shelf : GameObject {
    override func onClick() {
        if !GVC.progress.tookTealKey {
            if markedInventoryItem is Ladder {
                showComment("With the ladder, I can reach the key.")
            } else {
                showComment("There is a shelf there with a key, but it's out of reach.")
            }
        } else {
            showComment("It's a shelf. There used to be a key on it.")
        }
    }
}
