//
//  GrabbableObject.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-07.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class GrabbableObject {
    let sprite : SKSpriteNode
    var direction : Float = Float.pi * 0.5
    var speed : Float = 100
    
    init(sprite: SKSpriteNode) {
        self.sprite = sprite
    }
    
    func update(deltaTime: Float) {
        let pos = sprite.position
        let newX = Float(pos.x) + cosf(direction) * speed * deltaTime
        let newY = Float(pos.y) + sinf(direction) * speed * deltaTime
        sprite.position = CGPoint(x: CGFloat(newX), y: CGFloat(newY))
    }
    
}
