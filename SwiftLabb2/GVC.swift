//
//  GVC.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-07.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GVC: UIViewController {
    
    static var progress : Progress!

    override func viewDidLoad() {
        super.viewDidLoad()
        GVC.progress = Progress()
        
        if let view = self.view as! SKView? {
            //Turn on background music
            Sound.playBackgroundMusic()
            // Load the SKScene from 'IntroScene.sks'
            if let scene = SKScene(fileNamed: "IntroScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }

    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
