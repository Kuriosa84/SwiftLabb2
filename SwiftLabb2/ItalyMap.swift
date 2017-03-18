//
//  ItalyMap.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-18.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class ItalyMap : GameObject {
    override func onClick() {
        if !GVC.progress.openedColourSafe {
            showComment("What country is this? And why was this in the safe? Hm.")
        } else {
            showComment("It's Italy. Of course.")
        }
    }
}
