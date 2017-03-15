//
//  AdventureScene.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-13.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class AdventureScene : SKScene {
    var inventory : Inventory?
    var progress : Progress!
    var comment : SKMultilineLabel?
    
    override func didMove(to view: SKView) {
        if let actualInventory = inventory {
            actualInventory.removeFromParent()
            addChild(actualInventory)
            actualInventory.setSizeAndPosition()
            actualInventory.zPosition = 5
        } else {
            inventory = Inventory()
            addChild(inventory!)
            inventory!.setSizeAndPosition()
            inventory!.zPosition = 1
        }
        
        if progress == nil {
            progress = Progress()
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches
        {
            self.touchDown(atPoint: t.location(in: self))
        }
        for touch in (touches)
        {
            let positionInScene = touch.location(in: self)
            if let touchedNode = self.atPoint(positionInScene) as? SKSpriteNode
            {
                if let name = touchedNode.name
                {
                    if(inventory!.isInInventory(name)) {
                        if let marked = inventory!.markedItem {
                            inventory!.unmarkItem(item: marked)
                            if !(marked.name == name) {
                                inventory!.markItem(item: touchedNode)
                            }
                        } else {
                            inventory!.markItem(item: touchedNode)
                        }
                    } else if name == "comment" {
                        touchedNode.removeFromParent()
                    }
                }
            }
        }
    }
    
}
