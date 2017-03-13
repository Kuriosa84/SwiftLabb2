//
//  ColourSafeCloseUp.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-13.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class ColourSafeCloseUp : AdventureScene {
    
    var squares : [SKSpriteNode]!
    var lock : ColourSafeLock!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        lock = ColourSafeLock()
        squares = []
        
        //Draw squares for safe puzzle
        let margin = CGFloat(15)
        let buttonWidth = CGFloat((size.width - 6*margin) / 3)
        for i in 0...2 {
            let newButton = SKSpriteNode(color: .white, size: CGSize(width: buttonWidth, height: buttonWidth))
            newButton.position = CGPoint(x: (-1)*size.width/2 + buttonWidth/2 + 2 * margin + CGFloat( (buttonWidth + margin) * CGFloat(i)), y: (buttonWidth + margin) / 2)
            newButton.name = "\(i)"
            newButton.colorBlendFactor = 1.0
            addChild(newButton)
            squares.append(newButton)
        }
    }
    
    func drawSquare(nr: Int) {
        lock.changeColour(nr: nr)
        var newColour : UIColor
        switch(lock.currentGuess[nr]) {
        case .black: newColour = UIColor.black
        case .blue: newColour = UIColor(colorLiteralRed: 0.4, green: 0.5, blue: 1.0, alpha: 1.0)
        case .green: newColour = UIColor(colorLiteralRed: 0.1, green: 0.6, blue: 0.2, alpha: 1.0)
        case .red: newColour = UIColor(colorLiteralRed: 0.9, green: 0.1, blue: 0.1, alpha: 1.0)
        case .white: newColour = UIColor.white
        case .yellow: newColour = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.4, alpha: 1.0)
        }
        squares[nr].color = newColour
        if(lock.isCorrectCombination()) {
            Comment.showComment(text: "Woohoo! My instinct was right! I opened the safe!", scene: self)
            progress.openedColourSafe = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        for touch in (touches)
        {
            let positionInScene = touch.location(in: self)
            if let touchedNode = self.atPoint(positionInScene) as? SKSpriteNode
            {
                if let name = touchedNode.name {
                    if name == "back" {
                        let reveal = SKTransition.crossFade(withDuration: 1)
                        if let newScene = SKScene(fileNamed: "LeftWallScene") as? LeftWallScene
                        {
                            newScene.size = self.frame.size
                            newScene.scaleMode = .aspectFill
                            newScene.inventory = self.inventory
                            newScene.progress = self.progress
                            scene?.view?.presentScene(newScene, transition: reveal)
                        }
                    } else if !progress.openedColourSafe && (name == "0" || name == "1" || name == "2") {
                        drawSquare(nr: Int(name)!)
                    }
                }
            }
        }
    }
}
