//
//  FinalScene.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-14.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class FinalScene : SKScene {
    var backgroundMusic : SKAudioNode!
    
    override func didMove(to view: SKView) {
        if let musicURL = Bundle.main.url(forResource: "gettingthere", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(url: musicURL)
            addChild(backgroundMusic)
        }
    }
}
