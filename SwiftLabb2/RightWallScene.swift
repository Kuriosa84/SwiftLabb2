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
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        sceneToTheLeft = "GameScene"
        sceneToTheRight = "BackWallScene"
        
        let italyMapSprite = self.childNode(withName: "italyMap") as! SKSpriteNode
        if GVC.progress.openedGreySafe {
            italyMapSprite.zPosition = 1
        }
        let safeSprite = self.childNode(withName: "safe") as! SKSpriteNode
        let italyMap = ItalyMap(italyMapSprite)
        let safe = Safe(safeSprite)
        gameObjects.append(italyMap)
        gameObjects.append(safe)
    }
}
