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
        inventory?.removeFromParent()
        Comment.showComment(text: "Where am I? What happened?", scene: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch(nrOfClicks) {
        case 0: Comment.showComment(text: "I'm feeling a bit dizzy.", scene: self)
            nrOfClicks += 1
        case 1: Comment.showComment(text: "I seem to be in a small room...", scene: self)
            nrOfClicks += 1
        default: Comment.showComment(text: "I have to try to get out of here somehow!", scene: self)
        
            let reveal = SKTransition.fade(withDuration: 6)
        if let scene = SKScene(fileNamed: "GameScene") {
            scene.scaleMode = .aspectFill
            view?.presentScene(scene, transition: reveal)
            }
            
        }
    }
    
}
