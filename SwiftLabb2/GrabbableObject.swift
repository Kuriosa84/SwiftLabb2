//
//  GrabbableObject.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-07.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

enum GrabbableObjectType : Int {
    case doorKey, map
    var spriteName : String {
        let spriteNames = [
            "doorKey",
            "map"
        ]
        return spriteNames[rawValue]
    }
}

class GrabbableObject {
    var type : GrabbableObjectType
    var sprite : SKSpriteNode?
    var isInInventory : Bool
    
    init(type: GrabbableObjectType) {
        self.type = type
        isInInventory = false
    }
}
