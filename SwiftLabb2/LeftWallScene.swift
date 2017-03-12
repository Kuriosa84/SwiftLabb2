//
//  LeftWallScene.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-09.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import SpriteKit

class LeftWallScene : SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var background : SKSpriteNode!
    var inventory : Inventory?
    /*
    override init() {
        super.init(size: CGSize(width: 800, height: 1200))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    
    override func didMove(to view: SKView) {
        let rightArrow = SKSpriteNode(imageNamed: "right_arrow")
        rightArrow.name = "right"
        rightArrow.position = CGPoint(x: size.width/2 - rightArrow.size.width/2, y: 0)
        rightArrow.zPosition = 2
        addChild(rightArrow)
        
        if let actualInventory = inventory {
            actualInventory.removeFromParent()
            addChild(actualInventory)
            actualInventory.setSizeAndPosition()
            actualInventory.zPosition = 1
        } else {
            inventory = Inventory()
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            if let touchedNode = self.atPoint(positionInScene) as? SKSpriteNode,
                let name = touchedNode.name {
                if name == "player" {
                    if let actualTouchedNode = touchedNode as? GrabbableObject {
                        inventory!.addToInventory(item: actualTouchedNode)
                    }
                } else if name == "right" {
                    let reveal = SKTransition.crossFade(withDuration: 1)
                    if let newScene = SKScene(fileNamed: "GameScene") as? GameScene {
                        newScene.size = self.frame.size
                        newScene.scaleMode = .aspectFill
                        newScene.inventory = self.inventory
                        scene?.view?.presentScene(newScene,
                                                  transition: reveal)
                    }
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
