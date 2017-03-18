//
//  IntroScene.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-14.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class IntroScene : AdventureScene {
    
    var nrOfClicks : Int = 0
    
    override func didMove(to view: SKView) {
        inventory?.sprite.removeFromParent()
        showComment("Where am I? What happened?")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        switch(nrOfClicks) {
        case 0: showComment("I'm feeling a bit dizzy.")
            nrOfClicks += 1
        case 1: showComment("I seem to be in a small room...")
            nrOfClicks += 1
        default: showComment("I have to try to get out of here somehow!")
        
            let reveal = SKTransition.fade(withDuration: 6)
        if let scene = SKScene(fileNamed: "GameScene") {
            scene.scaleMode = .aspectFill
            view!.presentScene(scene, transition: reveal)
            }
        }
    }
    
}
