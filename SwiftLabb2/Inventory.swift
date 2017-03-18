//
//  Inventory.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-07.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//
//  Inventory is a box at the bottom of the screen, containing inventory items.
//  The items are child nodes to the main SKSpriteNode.

import Foundation
import SpriteKit

class Inventory {
    var sprite : SKSpriteNode!
    var markedItem : GameObject?
    var items : [GameObject] = []
    let height = CGFloat(100)
    let itemWidth = CGFloat(80)
    let margin = CGFloat(10)
    
    init() {
        
    }
    
    func isInInventory(item: GameObject) -> Bool {
        //== is defined for GameObject such that they are equal if they are of the same type
        return items.contains(item)
    }
    
    func addToInventory(item: GameObject) {
        items.append(item)
        item.sprite.removeFromParent()
        self.sprite.addChild(item.sprite)
        
        //Add this to the sprite name to avoid confusion with the sprite in the scene
        item.sprite.name! += "Inventory"
        
        item.sprite.zPosition = 100
        //Make item smaller
        item.sprite.size = CGSize(width: itemWidth, height: itemWidth)
        //Place item as far to the left as possible without overlapping other items
        item.sprite.position = CGPoint(x: margin + (-1)*self.sprite.size.width/2 + CGFloat(self.sprite.children.count) * (itemWidth + margin), y: 0)

    }
    
    func markItem(item: GameObject) {
        item.sprite.colorBlendFactor = 1.0
        item.sprite.color = .red
        markedItem = item
    }
    
    func unmarkItem(item: GameObject) {
        item.sprite.colorBlendFactor = 0.0
        markedItem = nil
    }
    
    func setSizeAndPosition() {
        sprite.size = CGSize(width: sprite.parent!.frame.width, height: self.height)
        sprite.position = CGPoint(x: 0, y: (-1)*sprite.parent!.frame.height/2 + self.height/2)
        sprite.zPosition = 50
    }
    
    func arrangeItems() {
        for (i, item) in sprite.children.enumerated() {
            item.position = CGPoint(x: margin + (-1)*sprite.size.width/2 + CGFloat(i) * (itemWidth + margin), y: 0)
        }
    }
    
    //removeFromInventory() is currently not used in the game. But maybe in future releases?
    func removeFromInventory(item: GameObject) {
        if let index = items.index(where: { $0 == item }) {
            items.remove(at: index)
        }
        if let parent = item.sprite.parent {
            if parent == sprite {
                item.sprite.removeFromParent()
            }
        }
        arrangeItems()
    }
}
