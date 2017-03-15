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
    
    override func didMove(to view: SKView) {
        Sound.playFinalMusic()
    }
}
