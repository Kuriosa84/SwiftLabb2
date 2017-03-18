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
    var player : GameObject!
    var background : SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        sceneToTheLeft = "LeftWallScene"
        sceneToTheRight = "RightWallScene"
        let doorSprite = self.childNode(withName: "door") as! SKSpriteNode
        let door = Door(doorSprite)
        gameObjects.append(door)
    }
}
