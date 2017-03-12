//
//  SafeCloseUp.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-12.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class SafeCloseUp : SKScene {
    var safeLock : SafeLockTrialError!
    var inventory : Inventory?
    //public static var button1, button2, button3, button4, button5, button6 : SKSpriteNode!
    public static var buttons : [SKSpriteNode]!
    
    override func didMove(to view: SKView) {
        
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
        
        SafeCloseUp.buttons = []
        let margin = CGFloat(15)
        let buttonWidth = CGFloat((size.width - 6*margin) / 3)
        
        //Create buttons for the safe opening puzzle
        for i in 1...6 {
            let newButton = SKSpriteNode(color: .gray, size: CGSize(width: buttonWidth, height: buttonWidth))
            newButton.name = "\(i)"
            if(i <= 3) {
                newButton.position = CGPoint(x: (-1)*size.width/2 + buttonWidth/2 + 2 * margin + CGFloat( (buttonWidth + margin) * CGFloat(i-1)), y: (buttonWidth + margin) / 2)
            } else {
                newButton.position = CGPoint(x: (-1)*size.width/2 + buttonWidth/2 + 2 * margin + CGFloat( (buttonWidth + margin) * CGFloat(i-4)), y: (-1)*(buttonWidth + margin) / 2)
            }
            newButton.zPosition = 5
            self.addChild(newButton)
            SafeCloseUp.buttons.append(newButton)
        }
        safeLock = SafeLockTrialError(scene: self)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
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
                if let name = touchedNode.name {
                    if name == "back" {
                        let reveal = SKTransition.crossFade(withDuration: 1)
                        if let newScene = SKScene(fileNamed: "RightWallScene") as? RightWallScene
                        {
                            newScene.size = self.frame.size
                            newScene.scaleMode = .aspectFill
                            newScene.inventory = self.inventory
                            scene?.view?.presentScene(newScene, transition: reveal)
                        }
                    } else {
                        safeLock.guess(touchedNode)
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
