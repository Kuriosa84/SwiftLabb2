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
    var inventorySprite : SKShapeNode?
    
    override func didMove(to view: SKView) {
        background = SKSpriteNode(imageNamed: "background2")
        background.size = self.frame.size
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = 0
        addChild(background)
        //background.size = self.frame.size
        
        //let height = self.frame.size.height
        let width = self.frame.size.width
        
        if let inventorySprite = inventorySprite {
            self.addChild(inventorySprite)
            let inventoryHeight = inventorySprite.frame.height
            //let inventoryWidth = inventorySprite.size.width
            inventorySprite.fillColor = UIColor.green
            inventorySprite.position = CGPoint(x: width/2, y: inventoryHeight/2)
            inventorySprite.zPosition = 1
        }
        
        let rightArrow = SKSpriteNode(imageNamed: "right_arrow")
        rightArrow.name = "right"
        rightArrow.position = CGPoint(x: size.width/2 - rightArrow.size.width, y: 0)
        rightArrow.zPosition = 2
        addChild(rightArrow)
        /*
        let multiLabel = SKMultilineLabel(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", labelWidth: 250, pos: CGPoint(x: size.width / 2, y: size.height / 2))
        self.addChild(multiLabel)
 */
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
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
                    moveToInventory(touchedNode)
                } else if name == "right" {
                    let reveal = SKTransition.reveal(with: .left,
                                                     duration: 1)
                    let newScene = GameScene(size: self.frame.size)
                    self.inventorySprite!.removeFromParent()
                    newScene.inventory = self.inventory
                    newScene.inventorySprite = self.inventorySprite
                    
                    scene?.view?.presentScene(newScene,
                                              transition: reveal)
                }
            }
        }
    }
    
    func moveToInventory(_ node : SKSpriteNode) {
        
        node.setScale(0.3)
        
        //let leftSide = -1 * self.frame.width / 2
        //let bottomSide = -1 * self.frame.height / 2
        /*
         let rightSide = self.frame.width / 2
         let topSide = self.frame.height / 2
         */
        /*
         let leftSide = -1 * UIScreen.main.bounds.width
         let bottomSide = -1 * UIScreen.main.bounds.height
         */
        //let height = node.size.height
        //let width = node.size.width
        node.removeFromParent()
        inventorySprite!.addChild(node)
        node.position = CGPoint(x: 0, y: 0 )
        
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
