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
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            if let touchedNode = self.atPoint(positionInScene) as? SKSpriteNode,
                let name = touchedNode.name {
                
            }
        }
    }
 */
}
