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
    
    let reveal = SKTransition.crossFade(withDuration: 1)
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
                        if let newScene = SKScene(fileNamed: "RightWallScene") as? RightWallScene {
                            newScene.size = self.frame.size
                            newScene.scaleMode = .aspectFill
                            newScene.inventory = self.inventory
                            newScene.progress = self.progress
                            scene?.view?.presentScene(newScene,
                                                      transition: reveal)
                        }
                    } else if name == "left" {
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
                            if inventory?.markedItem?.name == "tealKey" {
                                Comment.showComment(text: "Nooo! It doesn't fit! Maybe I'm stuck here forever...", scene: self)
                            } else if inventory?.markedItem?.name == "goldKey" {
                                Comment.showComment(text: "YES! It worked! I am finally out of here!", scene: self)
                                GameViewController.backgroundMusicPlayer.stop()
                                let when = DispatchTime.now() + 3 // 3 second delay
                                DispatchQueue.main.asyncAfter(deadline: when) {
                                    if let newScene = FinalScene(fileNamed: "FinalScene") {
                                        newScene.size = self.frame.size
                                        newScene.scaleMode = .aspectFill
                                        self.scene?.view?.presentScene(newScene,
                                                                  transition: self.reveal)
                                    }
                                }
                            } else {
                                Comment.showComment(text: "It's locked...", scene: self)
                            }
                        }
                    }
                }
            }
        }
    }
}
