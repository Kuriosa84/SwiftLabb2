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

class Inventory : SKSpriteNode {
    var itemSprite : SKSpriteNode?
    let height = CGFloat(100)
    let itemWidth = CGFloat(80)
    let margin = CGFloat(10)
    var items : [String] = []
    var markedItem : SKSpriteNode?
    
    init() {
        let texture = SKTexture(imageNamed: "inventory")
        //width 1000 är tillfälligt, sätter bredd i setSizeAndPosition()
        super.init(texture: texture, color: .black, size: CGSize(width: 1000, height: self.height))
    }
    
    func setSizeAndPosition() {
        self.size = CGSize(width: self.parent!.frame.width, height: self.height)
        self.position = CGPoint(x: 0, y: (-1)*self.parent!.frame.height/2 + self.height/2)
        self.zPosition = 50
    }
    
    func markItem(item: SKSpriteNode) {
        item.colorBlendFactor = 1.0
        item.color = .red
        markedItem = item
    }
    
    func unmarkItem(item: SKSpriteNode) {
        item.colorBlendFactor = 0.0
        markedItem = nil
    }
    
    func useMarkedItem(with: SKSpriteNode) {
        
    }
    
    func isInInventory(_ name: String) -> Bool {
            return items.contains(name)
    }
    
    func addToInventory(item: SKSpriteNode) {
        if let name = item.name {
            items.append(name)
        }
        //Add item sprite as child of box
        item.removeFromParent()
        self.addChild(item)
        item.zPosition = 100
        //Make item smaller
        item.size = CGSize(width: itemWidth, height: itemWidth)
        //Place item as far to the left as possible without overlapping other items
        item.position = CGPoint(x: margin + (-1)*self.size.width/2 + CGFloat(self.children.count) * (itemWidth + margin), y: 0)
    }
    
    func arrangeItems() {
        for (i, item) in self.children.enumerated() {
            item.position = CGPoint(x: margin + (-1)*self.size.width/2 + CGFloat(i) * (itemWidth + margin), y: 0)
        }
    }
    
    func removeFromInventory(item: SKSpriteNode) {
        if(item.parent == self) {
            item.removeFromParent()
        }
    }
    
    //This one is required by SKSpriteNode
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
