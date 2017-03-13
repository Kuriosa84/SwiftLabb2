//
//  GameScene.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-07.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import SpriteKit
import Foundation

class GameScene: AdventureScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var player : GrabbableObject!
    var background : SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesBegan(touches, with: event)
        for touch in (touches)
        {
            let positionInScene = touch.location(in: self)
            if let touchedNode = self.atPoint(positionInScene) as? SKSpriteNode
            {
                if let name = touchedNode.name {
                    if name == "right" {
                        let reveal = SKTransition.crossFade(withDuration: 1)
                        if let newScene = SKScene(fileNamed: "RightWallScene") as? RightWallScene {
                            newScene.size = self.frame.size
                            newScene.scaleMode = .aspectFill
                            newScene.inventory = self.inventory
                            newScene.progress = self.progress
                            scene?.view?.presentScene(newScene,
                                                      transition: reveal)
                        }
                    } else if name == "left" {
                        let reveal = SKTransition.crossFade(withDuration: 1)
                        if let newScene = LeftWallScene(fileNamed: "LeftWallScene") {
                            newScene.size = self.frame.size
                            newScene.scaleMode = .aspectFill
                            newScene.inventory = self.inventory
                            newScene.progress = self.progress
                            scene?.view?.presentScene(newScene,
                                                      transition: reveal)
                        }
                    } else  {
                        if name == "door" {
                            if inventory?.markedItem.name == "tealKey" {
                                Comment.showComment(text: "Nooo! It doesn't fit! Maybe I'm stuck here forever...", scene: self)
                            }
                            Comment.showComment(text: "It's locked...", scene: self)
                        }
                    }
                }
            }
        }
    }
}
