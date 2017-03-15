//
//  LeftWallScene.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-09.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import SpriteKit
import Foundation

class LeftWallScene : AdventureScene {
    
    var painting : SKSpriteNode!
    var safe : SKSpriteNode!
    var tealKey : SKSpriteNode?
    var goldKey : SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        painting = self.childNode(withName: "painting") as! SKSpriteNode
        goldKey = self.childNode(withName: "goldKey") as? SKSpriteNode
        
        safe = self.childNode(withName: "colourSafe") as! SKSpriteNode
        tealKey = self.childNode(withName: "tealKey") as? SKSpriteNode
        if progress.tookTealKey {
            tealKey?.removeFromParent()
        }
        if progress.openedColourSafe {
            safe.texture = SKTexture(imageNamed: "openColourSafe")
            if !progress.tookGoldKey {
                goldKey!.zPosition = 2
            }
        }
        if progress.removedPainting {
            painting.position.y -= 300
        }
        if progress.tookGoldKey {
            goldKey?.removeFromParent()
        }
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
                    if let newScene = SKScene(fileNamed: "GameScene") as? GameScene {
                        newScene.size = self.frame.size
                        newScene.scaleMode = .aspectFill
                        newScene.inventory = self.inventory
                        newScene.progress = self.progress
                        scene?.view?.presentScene(newScene,
                                                  transition: reveal)
                    }
                } else if name == "left" {
                    let reveal = SKTransition.crossFade(withDuration: 1)
                    if let newScene = SKScene(fileNamed: "BackWallScene") as? BackWallScene {
                        newScene.size = self.frame.size
                        newScene.scaleMode = .aspectFill
                        newScene.inventory = self.inventory
                        newScene.progress = self.progress
                        scene?.view?.presentScene(newScene,
                                                  transition: reveal)
                    }
                } else if name == "painting" {
                    if !progress.removedPainting {
                        if inventory?.markedItem?.name == "ladder" {
                            progress.removedPainting = true
                            painting.position.y -= 300
                            let when = DispatchTime.now() + 0.5 // 0.5 second delay
                            DispatchQueue.main.asyncAfter(deadline: when) {
                                Comment.showComment(text: "There is a safe behind the painting!", scene: self)
                            }
                        } else if inventory?.markedItem == nil {
                            Comment.showComment(text: "I can't reach it.", scene: self)
                        } else {
                            Comment.showComment(text: "I can't use that with the painting.", scene: self)
                        }
                    }
                } else if name == "shelf" || name == "tealKey" {
                    if !(inventory!.isInInventory("tealKey")) {
                        if inventory?.markedItem?.name == "ladder" {
                            if let actualKey = tealKey {
                                inventory?.addToInventory(item: actualKey)
                                progress.tookTealKey = true
                                Comment.showComment(text: "Yes! I got the key! Maybe it will get me out of here!", scene: self)
                            }
                        } else if inventory?.markedItem == nil {
                            Comment.showComment(text: "There's a key there, but I can't reach it!", scene: self)
                        } else {
                            Comment.showComment(text: "I can't use that here.", scene: self)
                        }
                    } else if progress!.tookTealKey && name == "shelf" {
                        Comment.showComment(text: "It's a shelf. There used to be a key on it.", scene: self)
                    }
                } else if name == "colourSafe" {
                    if !progress.openedColourSafe {
                        if let newScene = SKScene(fileNamed: "ColourSafeCloseUp") as? ColourSafeCloseUp {
                            let reveal = SKTransition.crossFade(withDuration: 1)
                            newScene.size = self.frame.size
                            newScene.scaleMode = .aspectFill
                            newScene.inventory = self.inventory
                            newScene.progress = self.progress
                            scene?.view?.presentScene(newScene,
                                                      transition: reveal)
                        }
                    } else if !progress.tookGoldKey {
                        Comment.showComment(text: "There's a golden key in the safe. I should take it.", scene: self)
                    } else {
                        Comment.showComment(text: "There is nothing else in the safe.", scene: self)
                    }
                } else if name == "goldKey" {
                    inventory?.addToInventory(item: goldKey!)
                    progress.tookGoldKey = true
                    Comment.showComment(text: "This has to be the key to the door so that I can get out of here... right?", scene: self)
                }
            }
        }
    }
}
