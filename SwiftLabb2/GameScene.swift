//
//  GameScene.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-07.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import SpriteKit
//import UIKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var player : GrabbableObject!
    var background : SKSpriteNode!
    var inventory : Inventory?
    
    override func didMove(to view: SKView) {
        
        //let height = self.frame.height
        //let width = size.width
        
        if let actualInventory = inventory {
            actualInventory.removeFromParent()
            addChild(actualInventory)
            actualInventory.setSizeAndPosition()
            actualInventory.zPosition = 1
        } else {
            inventory = Inventory()
            addChild(inventory!)
            inventory!.setSizeAndPosition()
            inventory!.zPosition = 1
        }
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let label = self.label
        {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
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
                    if name == "left"
                    {
                        let reveal = SKTransition.crossFade(withDuration: 1)
                        self.inventory!.removeFromParent()
                        if let newScene = SKScene(fileNamed: "LeftWallScene") as? LeftWallScene
                        {
                            newScene.size = self.frame.size
                            newScene.scaleMode = .aspectFill
                            newScene.inventory = self.inventory
                            scene?.view?.presentScene(newScene, transition: reveal)
                        }
                    }
                    else if name == "right" {
                        let reveal = SKTransition.crossFade(withDuration: 1)
                        self.inventory!.removeFromParent()
                        if let newScene = SKScene(fileNamed: "RightWallScene") as? RightWallScene
                        {
                            newScene.size = self.frame.size
                            newScene.scaleMode = .aspectFill
                            newScene.inventory = self.inventory
                            scene?.view?.presentScene(newScene, transition: reveal)
                        }
                    }
                    else
                    {
                        if(!inventory!.isInInventory(name)) {
                            inventory!.addToInventory(item: touchedNode)
                        } else {
                            if let marked = inventory!.markedItem {
                                inventory!.unmarkItem(item: marked)
                                if !(marked.name == name) {
                                    inventory!.markItem(item: touchedNode)
                                }
                            } else {
                                inventory!.markItem(item: touchedNode)
                            }
                        }
                    }
                }
                else
                {
                    inventory!.addToInventory(item: touchedNode)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
