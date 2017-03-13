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
    
    
    override func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        self.safe = self.childNode(withName: "safe") as? SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            if let touchedNode = self.atPoint(positionInScene) as? SKSpriteNode,
                let name = touchedNode.name {
                if name == "safe" {
                    let reveal = SKTransition.crossFade(withDuration: 1)
                    if let newScene = SKScene(fileNamed: "SafeCloseUp") as? SafeCloseUp
                    {
                        newScene.size = self.frame.size
                        newScene.scaleMode = .aspectFill
                        newScene.inventory = self.inventory
                        newScene.progress = self.progress
                        scene?.view?.presentScene(newScene, transition: reveal)
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
                }
            }
        }
    }
}
