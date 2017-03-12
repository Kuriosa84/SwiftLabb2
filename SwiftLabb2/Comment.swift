//
//  Comment.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-11.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class Comment {
    let label : SKLabelNode
    let text : String
    
    init(text : String) {
        label = SKLabelNode(fontNamed: "Chalkduster")
        self.text = text
    }
    
    static func showComment(text: String, scene: SKScene) {
        let multiLabel = SKMultilineLabel(text: text, labelWidth: 450, pos: CGPoint(x: 0, y: 0), fontName: "Chalkduster", fontSize: 30, fontColor: UIColor.black, leading: nil, alignment: .center, shouldShowBorder: true)
        multiLabel.zPosition = 99
        scene.addChild(multiLabel)
        
        let when = DispatchTime.now() + 4 // 4 second delay
        DispatchQueue.main.asyncAfter(deadline: when) {
            multiLabel.removeFromParent()
        }

    }
    
    static func oldShowComment(text: String, scene: SKScene) {
        var labels : [SKLabelNode] = []
        
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = text
        label.fontColor = .white
        label.position = CGPoint(x: 0, y: 0)
        label.zPosition = 10
        labels.append(label)
        
        var i = 1
        while(i <= 8) {
            let newLabel = SKLabelNode(fontNamed: "Chalkduster")
            newLabel.text = text
            newLabel.position = CGPoint(x: i, y: (-1)*i)
            newLabel.zPosition = 9
            newLabel.fontColor = .black
            labels.append(newLabel)
            i += 1
        }
        
        for label in labels {
            scene.addChild(label)
        }
        
        let when = DispatchTime.now() + 5 // change 5 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            for label in labels {
                label.removeFromParent()
            }
        }
    }
}
