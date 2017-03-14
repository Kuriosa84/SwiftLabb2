//
//  BackWallScene.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-09.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class BackWallScene : AdventureScene {
    
    var ladder : SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        ladder = self.childNode(withName: "ladder") as! SKSpriteNode?
        if progress.tookLadder {
            ladder?.removeFromParent()
        }
        
        let blueSky = SKSpriteNode(color: SKColor.init(colorLiteralRed: 0.6, green: 0.7, blue: 0.9, alpha: 1), size: frame.size)
        blueSky.zPosition = -2
        addChild(blueSky)
        
        let snow = SKEmitterNode(fileNamed: "Snow")
        addChild(snow!)
        snow?.position = CGPoint(x: 0, y: size.height / 2)
        snow?.advanceSimulationTime(5)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            if let touchedNode = self.atPoint(positionInScene) as? SKSpriteNode,
                let name = touchedNode.name {
                if name == "right" {
                    let reveal = SKTransition.crossFade(withDuration: 1)
                    if let newScene = SKScene(fileNamed: "LeftWallScene") as? LeftWallScene {
                        newScene.size = self.frame.size
                        newScene.scaleMode = .aspectFill
                        newScene.inventory = self.inventory
                        newScene.progress = self.progress
                        scene?.view?.presentScene(newScene,
                                                  transition: reveal)
                    }
                } else if name == "left" {
                    let reveal = SKTransition.crossFade(withDuration: 1)
                    if let newScene = SKScene(fileNamed: "RightWallScene") as? RightWallScene {
                        newScene.size = self.frame.size
                        newScene.scaleMode = .aspectFill
                        newScene.inventory = self.inventory
                        newScene.progress = self.progress
                        scene?.view?.presentScene(newScene,
                                                  transition: reveal)
                    }
                } else if name == "ladder" {
                    inventory?.addToInventory(item: touchedNode)
                    progress.tookLadder = true
                    Comment.showComment(text: "A ladder is always good to have. I'll just take it and carry it around.", scene: self)
                } else if name == "windowBackground" {
                    Comment.showComment(text: "It's snowing outside. It looks beautiful. But the window doesn't open.", scene: self)
                }
            }
        }
    }

    
    
    
    
}
