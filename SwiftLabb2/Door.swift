//
//  Door.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-16.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class Door : GameObject {
    override func onClick() {
        if markedInventoryItem is TealKey {
            showComment("Nooo! It doesn't fit! Maybe I'm stuck here forever...")
            
        } else if markedInventoryItem is GoldKey {
            Sound.playClickSound()
            showComment("YES! It worked! I am finally out of here!")
            Sound.backgroundMusicPlayer.stop()
            let when = DispatchTime.now() + 3 // 3 second delay
            DispatchQueue.main.asyncAfter(deadline: when) {
                let reveal = SKTransition.fade(withDuration: 3)
                if let newScene = FinalScene(fileNamed: "FinalScene") {
                    newScene.size = self.sprite.parent!.frame.size
                    newScene.scaleMode = .aspectFill
                    self.sprite.parent!.scene?.view?.presentScene(newScene,
                                                   transition: reveal)
                }
            }
        } else {
            showComment("It's locked...")
        }
    }
}
