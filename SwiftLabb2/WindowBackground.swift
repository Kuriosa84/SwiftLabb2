//
//  WindowBackground.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-16.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import SpriteKit

class WindowBackground : GameObject {
    override func onClick() {
        showComment("It's snowing outside. It looks beautiful. But the window doesn't open.")
    }
}
