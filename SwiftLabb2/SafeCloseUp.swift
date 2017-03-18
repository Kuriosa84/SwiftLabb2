//
//  SafeCloseUp.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-12.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation

class SafeCloseUp : AdventureScene {
    var safeLock : SafeLockTrialError!
    var buttons : [SKSpriteNode]!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        buttons = []
        let margin = CGFloat(15)
        let buttonWidth = CGFloat((size.width - 6*margin) / 3)
        
        //Create buttons for the safe opening puzzle
        for i in 1...6 {
            let newButton = SKSpriteNode(color: .gray, size: CGSize(width: buttonWidth, height: buttonWidth))
            newButton.name = "\(i)"
            if(i <= 3) {
                newButton.position = CGPoint(x: (-1)*size.width/2 + buttonWidth/2 + 2 * margin + CGFloat( (buttonWidth + margin) * CGFloat(i-1)), y: (buttonWidth + margin) / 2)
            } else {
                newButton.position = CGPoint(x: (-1)*size.width/2 + buttonWidth/2 + 2 * margin + CGFloat( (buttonWidth + margin) * CGFloat(i-4)), y: (-1)*(buttonWidth + margin) / 2)
            }
            newButton.zPosition = 5
            self.addChild(newButton)
            buttons.append(newButton)
        }
        safeLock = SafeLockTrialError()
    }
    
    override func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func openSafeSound() {
        let soundURL = Bundle.main.url(forResource: "clicksound", withExtension: "mp3")!
        var soundPlayer : AVAudioPlayer?
        do {
            try soundPlayer = AVAudioPlayer(contentsOf: soundURL)
        } catch {}
        soundPlayer?.volume = 1.0
        soundPlayer?.numberOfLoops = 0
        soundPlayer?.prepareToPlay()
        soundPlayer?.play()
    }
    
    func activateButton(_ button: SKSpriteNode) {
        button.colorBlendFactor = 1.0
        button.color = .darkGray
    }
    
    func deactivateButtons() {
        for button in self.buttons {
            button.color = .gray
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches
        {
            self.touchDown(atPoint: t.location(in: self))
        }
        for touch in (touches)
        {
            let positionInScene = touch.location(in: self)
            if let touchedNode = self.atPoint(positionInScene) as? SKSpriteNode
            {
                if let name = touchedNode.name {
                    if name == "back" {
                        let reveal = SKTransition.crossFade(withDuration: 1)
                        if let newScene = SKScene(fileNamed: "RightWallScene") as? RightWallScene
                        {
                            newScene.size = self.frame.size
                            newScene.scaleMode = .aspectFill
                            newScene.inventory = self.inventory
                            if GVC.progress.openedGreySafe {
                                let multiLabel = SKMultilineLabel(text: "It's a map of some country. It looks like a boot. I'll put it on the wall.", labelWidth: Int(size.width) - 40, pos: CGPoint(x: 0, y: 0), fontName: "Chalkduster", fontSize: 30, fontColor: UIColor.black, leading: nil, alignment: .center, shouldShowBorder: true)
                                multiLabel.zPosition = 99
                                
                                newScene.comment = multiLabel
                                
                                newScene.addChild(multiLabel)
                            }
                            scene?.view?.presentScene(newScene, transition: reveal)
                        }
                    } else if name == "1" || name == "2" || name == "3" || name == "4"
                        || name == "5" || name == "6" {
                        if safeLock.guess(nr: Int(name)!) {
                            activateButton(touchedNode)
                            if safeLock.correctGuesses == safeLock.correctCombination.count {
                                showComment("Yay! I opened the safe!")
                                openSafeSound()
                            }
                        } else {
                            activateButton(touchedNode)
                            let when = DispatchTime.now() + 0.2 // 0.2 second delay
                            DispatchQueue.main.asyncAfter(deadline: when) {
                                self.deactivateButtons()
                            }
                        }
                    }
                }
            }
        }
    }
}
