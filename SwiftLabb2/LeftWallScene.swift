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
    
    override func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        sceneToTheLeft = "BackWallScene"
        sceneToTheRight = "GameScene"
        
        let paintingSprite = self.childNode(withName: "painting") as! SKSpriteNode
        let safeSprite = self.childNode(withName: "colourSafe") as! SKSpriteNode
        let tealKeySprite = self.childNode(withName: "tealKey") as! SKSpriteNode
        let goldKeySprite = self.childNode(withName: "goldKey") as! SKSpriteNode
        let shelfSprite = self.childNode(withName: "shelf") as! SKSpriteNode
        
        if GVC.progress.tookTealKey {
            tealKeySprite.removeFromParent()
        }
        if GVC.progress.tookGoldKey {
            goldKeySprite.removeFromParent()
        }
        
        //Create objects
        let painting = Painting(paintingSprite)
        let safe = ColourSafe(safeSprite)
        let tealKey = TealKey(tealKeySprite)
        let goldKey = GoldKey(goldKeySprite)
        let shelf = Shelf(shelfSprite)
        gameObjects.append(painting)
        gameObjects.append(safe)
        gameObjects.append(tealKey)
        gameObjects.append(goldKey)
        gameObjects.append(shelf)
        
        if GVC.progress.openedColourSafe {
            safeSprite.texture = SKTexture(imageNamed: "openColourSafe")
            if !GVC.progress.tookGoldKey {
                goldKeySprite.zPosition = 2
            }
        }
        if GVC.progress.removedPainting {
            paintingSprite.position.y -= 300
        }
    }
}
