//
//  Painting.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-16.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class Painting : GameObject {
    override func onClick() {
        if !GVC.progress.removedPainting {
            if markedInventoryItem is Ladder {
                GVC.progress.removedPainting = true
                self.sprite!.position.y -= 300
                let when = DispatchTime.now() + 0.5 // 0.5 second delay
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.showComment("There is a safe behind the painting!")
                }
            } else if markedInventoryItem == nil {
                showComment("I can't reach it.")
            } else {
                showComment("I can't use that with the painting.")
            }
        } else {
            showComment("What a beautiful painting.")
        }
    }
}
