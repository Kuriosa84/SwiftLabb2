//
//  Inventory.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-07.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class Inventory {
    var items : [GrabbableObject] = []
    var rect : SKShapeNode!
    var itemSprite : SKSpriteNode?
    
    init(sprite: SKShapeNode) {
        self.rect = sprite
        //sprite.childNode(withName: itemSprite)
    }
    
    func addToInventory(item: GrabbableObject) {
        //Move the sprite to bottom of screen
        //Add inventory object representation to UserDefaults
    }
    
    func removeFromInventory(item: GrabbableObject) {
        //Remove sprite
        //Remove inventory object from UserDefaults
    }
    
}
