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
    
    override func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        sceneToTheLeft = "RightWallScene"
        sceneToTheRight = "LeftWallScene"
        
        
        
            let ladderSprite = self.childNode(withName: "ladder") as! SKSpriteNode
            let ladder = Ladder(ladderSprite)
            gameObjects.append(ladder)
        
        //NEW STUFF
        if GVC.progress.tookLadder {
            ladderSprite.removeFromParent()
        }
        
        
        let windowBackGroundSprite = self.childNode(withName: "windowBackground") as! SKSpriteNode
        let windowBackground = WindowBackground(windowBackGroundSprite)
        gameObjects.append(windowBackground)
        
        let blueSky = SKSpriteNode(color: SKColor.init(colorLiteralRed: 0.6, green: 0.7, blue: 0.9, alpha: 1), size: frame.size)
        blueSky.zPosition = -2
        addChild(blueSky)
        
        let snow = SKEmitterNode(fileNamed: "Snow")
        addChild(snow!)
        snow?.position = CGPoint(x: 0, y: size.height / 2)
        snow?.advanceSimulationTime(5)
    }
}
