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
        let multiLabel = SKMultilineLabel(text: text, labelWidth: Int(scene.size.width) - 40, pos: CGPoint(x: 0, y: 0), fontName: "Chalkduster", fontSize: 30, fontColor: UIColor.black, leading: nil, alignment: .center, shouldShowBorder: true)
        multiLabel.zPosition = 99
        scene.addChild(multiLabel)
        
        let when = DispatchTime.now() + 4 // 4 second delay
        DispatchQueue.main.asyncAfter(deadline: when) {
            multiLabel.removeFromParent()
        }
    }
}
