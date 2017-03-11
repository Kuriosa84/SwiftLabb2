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
        let width = size.width
        
        background = SKSpriteNode(imageNamed: "door")
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = 0
        addChild(background)
        
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
        
        if(!inventory!.isInInventory("spaceship")) {
            let spaceship = SKSpriteNode(imageNamed: "Spaceship")
            spaceship.position = CGPoint(x: -100, y: -100)
            spaceship.name = "spaceship"
            spaceship.zPosition = 5
            addChild(spaceship)
        }
        
        if(!inventory!.isInInventory("farnsworth")) {
            let professor = SKSpriteNode(imageNamed: "farnsworth")
            professor.size.width = 100
            professor.size.height = 100
            professor.position = CGPoint(x: -300, y: -350)
            professor.name = "farnsworth"
            professor.zPosition = 5
            addChild(professor)
        }
        
        Comment.showComment(text: "Hey baberiba!", scene: self)
        
        
        let leftArrowSprite = SKSpriteNode(imageNamed: "left_arrow")
        leftArrowSprite.zPosition = 1
        leftArrowSprite.name = "left"
        let leftArrowWidth = leftArrowSprite.size.width
        leftArrowSprite.position = CGPoint(x: (-1)*width/2 + leftArrowWidth/2, y: 0)
        addChild(leftArrowSprite)
        /*
        let multiLabel = SKMultilineLabel(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", labelWidth: 250, pos: CGPoint(x: 30, y: 30))
        multiLabel.zPosition = 10
        addChild(multiLabel)
        
        let multiLabel2 = SKMultilineLabel(text: "Hej bla bla bla bla bla tjosan hejsan hoppsan i lingonskogen tjo bla blä hej nej jo men fast att nej", labelWidth: 200, pos: CGPoint(x: 0, y: 0), fontName: "Chalkduster", fontSize: 40, fontColor: UIColor.black, leading: nil, alignment: .center, shouldShowBorder: true)
        multiLabel2.zPosition = 99
        addChild(multiLabel2)
         */
        
        /*
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
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
                        let reveal = SKTransition.fade(withDuration: 2)
                        self.inventory!.removeFromParent()
                        if let newScene = SKScene(fileNamed: "LeftWallScene") as? LeftWallScene
                        {
                            newScene.size = self.frame.size
                            newScene.scaleMode = .aspectFill
                            newScene.inventory = self.inventory
                            scene?.view?.presentScene(newScene,
                                                      transition: reveal)
                        }
                    }
                    else {
                        inventory!.addToInventory(item: touchedNode)
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
