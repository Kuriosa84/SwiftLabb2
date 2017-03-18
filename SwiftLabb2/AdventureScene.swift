//
//  AdventureScene.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-13.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//
// Super class to all the scenes of the game. 

import Foundation
import SpriteKit

class AdventureScene : SKScene {
    
    var inventorySprite : SKSpriteNode?
    var inventory : Inventory?
    var comment : SKMultilineLabel?
    let reveal : SKTransition = SKTransition.crossFade(withDuration: 1.5)
    var sceneToTheRight : String = "RightWallScene"
    var sceneToTheLeft : String = "LeftWallScene"
    var gameObjects : [GameObject] = []
    
    override func didMove(to view: SKView) {
        if let actualInventory = inventory {
            actualInventory.sprite.removeFromParent()
            addChild(actualInventory.sprite)
            actualInventory.setSizeAndPosition()
        } else {
            inventory = Inventory()
            inventorySprite = SKSpriteNode(color: .darkGray, size: CGSize(width: self.size.width, height: 100))
            inventory!.sprite = inventorySprite
            addChild(inventorySprite!)
            inventory!.setSizeAndPosition()
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func openNewScene(name: String) {
        if let newScene = SKScene(fileNamed: name) as? AdventureScene {
            newScene.size = self.frame.size
            newScene.scaleMode = .aspectFill
            newScene.inventory = inventory
            scene?.view?.presentScene(newScene,
                                      transition: reveal)
        }
    }
    
    func showComment(_ text: String) {
        let multiLabel = SKMultilineLabel(text: text, labelWidth: Int(size.width) - 40, pos: CGPoint(x: 0, y: 0), fontName: "Chalkduster", fontSize: 30, fontColor: UIColor.black, leading: nil, alignment: .center, shouldShowBorder: true)
        multiLabel.zPosition = 99
        
        comment = multiLabel
        
        addChild(comment!)
    }
    
    func getGameObject(spriteName : String) -> GameObject? {
        for item in gameObjects {
            if item.sprite!.name! == spriteName {
                return item
            }
        }
        for item in inventory!.items {
            if item.sprite!.name == spriteName {
                return item
            }
        }
        return nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches
        {
            self.touchDown(atPoint: t.location(in: self))
        }
        for touch in (touches)
        {
            if let actualComment = comment {
                actualComment.removeFromParent()
                comment = nil
            } else {
                let positionInScene = touch.location(in: self)
                if let touchedNode = self.atPoint(positionInScene) as? SKSpriteNode
                {
                    
                    if let name = touchedNode.name
                    {
                        if name == "right" {
                            openNewScene(name: sceneToTheRight)
                        } else if name == "left" {
                            openNewScene(name: sceneToTheLeft)
                        }
                        
                        if let item = getGameObject(spriteName: name) {
                            if(inventory!.isInInventory(item: item)) {
                                if let marked = inventory!.markedItem {
                                    inventory!.unmarkItem(item: marked)
                                    if !(marked.sprite!.name! == name) {
                                        inventory!.markItem(item: item)
                                    }
                                } else {
                                    inventory!.markItem(item: item)
                                }
                            } else {
                                item.onClick()
                            }
                        }
                    }
                }
            }
        }
    }
    
}
