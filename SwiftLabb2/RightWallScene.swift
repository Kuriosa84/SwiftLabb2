//
//  RightWallScene.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-09.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class RightWallScene : AdventureScene {
    var background : SKSpriteNode!
    var safe : SKSpriteNode?
    var italyMap : SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        
        italyMap = self.childNode(withName: "italyMap") as! SKSpriteNode?
        if progress.openedGreySafe {
            italyMap.zPosition = 1
        }
        safe = self.childNode(withName: "safe") as? SKSpriteNode
        super.didMove(to: view)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            if let touchedNode = self.atPoint(positionInScene) as? SKSpriteNode,
                let name = touchedNode.name {
                if name == "safe" {
                    if !progress.openedGreySafe {
                        let reveal = SKTransition.crossFade(withDuration: 1)
                        if let newScene = SKScene(fileNamed: "SafeCloseUp") as? SafeCloseUp
                        {
                            newScene.size = self.frame.size
                            newScene.scaleMode = .aspectFill
                            newScene.inventory = self.inventory
                            newScene.progress = self.progress
                            scene?.view?.presentScene(newScene, transition: reveal)
                        }
                    } else {
                        Comment.showComment(text: "There is nothing else in the safe.", scene: self)
                    }
                } else if name == "right" {
                    let reveal = SKTransition.crossFade(withDuration: 1)
                    if let newScene = SKScene(fileNamed: "BackWallScene") as? BackWallScene
                    {
                        newScene.size = self.frame.size
                        newScene.scaleMode = .aspectFill
                        newScene.inventory = self.inventory
                        newScene.progress = self.progress
                        scene?.view?.presentScene(newScene, transition: reveal)
                    }
                } else if name == "left" {
                    let reveal = SKTransition.crossFade(withDuration: 1)
                    if let newScene = SKScene(fileNamed: "GameScene") as? GameScene
                    {
                        newScene.size = self.frame.size
                        newScene.scaleMode = .aspectFill
                        newScene.inventory = self.inventory
                        newScene.progress = self.progress
                        scene?.view?.presentScene(newScene, transition: reveal)
                    }
                } else if name == "italyMap" {
                    Comment.showComment(text: "What country is this? And why was this in the safe? Hm.", scene: self)
                }
            }
        }
    }
}
