//
//  Safe.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-18.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class Safe : GameObject {
    override func onClick() {
        if !GVC.progress.openedGreySafe {
            openNewScene(name: "SafeCloseUp")
        } else {
            showComment("There is nothing else in the safe.")
        }

    }
}
