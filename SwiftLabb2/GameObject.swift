//
//  GameObject.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-18.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class GameObject : Equatable {
    var sprite : SKSpriteNode!
    var markedInventoryItem : GameObject? {
        if let scene = sprite.parent! as? AdventureScene {
            return scene.inventory!.markedItem
        }
        return nil
    }
    
    //The sprite MUST have the name property set
    init(_ sprite: SKSpriteNode) {
        self.sprite = sprite
    }
    
    //Override this in every subclass
    func onClick() {
    }
    
    func addToInventory() {
        if let scene = sprite.parent! as? AdventureScene {
            scene.inventory!.addToInventory(item: self)
        }
    }
    
    func openNewScene(name: String) {
        if let scene = sprite.parent! as? AdventureScene {
            scene.openNewScene(name: name)
        }
    }
    
    func showComment(_ text: String) {
        if let gvc = UIApplication.shared.windows[0].rootViewController as? GVC,
            let view = gvc.view as? SKView,
            let scene = view.scene as? AdventureScene {
            scene.showComment(text)
        }
    }
        
}

//Defined this to be able to use .contains in Inventory
func ==(lhs: GameObject, rhs: GameObject) -> Bool {
    return class_getName(type(of: lhs)) == class_getName(type(of: rhs))
}

    
