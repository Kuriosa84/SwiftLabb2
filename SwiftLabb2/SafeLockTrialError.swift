//
//  SafeLockTrialError.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-09.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import AVFoundation
import SpriteKit

class SafeLockTrialError {
    
    var soundPlayer : AVAudioPlayer!
    var correctSequence : [Int]
    var isCorrect : Bool
    var correctAnswers : Int
    var scene : SKScene
    
    init(scene : SKScene) {
        correctAnswers = 0
        isCorrect = true
        correctSequence = [3, 1, 5, 4, 6, 2]
        self.scene = scene
    }
    
    func guess(_ button: SKSpriteNode) {
        if correctAnswers >= correctSequence.count {
            return
        }
        
        let buttonNr = Int(button.name!)!
        if buttonNr == correctSequence[correctAnswers] {
            activateButton(button)
            correctAnswers += 1
            if correctAnswers == correctSequence.count {
                openSafe()
            }
        } else {
            correctAnswers = 0
            activateButton(button)
            let when = DispatchTime.now() + 0.2 // 0.2 second delay
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.deactivateButtons()
            }
            
        }
    }
    
    func activateButton(_ button: SKSpriteNode) {
        button.colorBlendFactor = 1.0
        button.color = .darkGray
    }
    
    func deactivateButtons() {
        for button in SafeCloseUp.buttons {
            button.color = .gray
        }
    }
    
    func openSafe() {
        Comment.showComment(text: "The safe is open! Hooray!", scene: scene)
        let soundURL = Bundle.main.url(forResource: "clicksound", withExtension: "mp3")!
        do {
            try soundPlayer = AVAudioPlayer(contentsOf: soundURL)
        } catch {}
        soundPlayer.volume = 1.0
        soundPlayer.numberOfLoops = 0
        soundPlayer.prepareToPlay()
        soundPlayer.play()
    }
    
}
