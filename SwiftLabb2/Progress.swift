//
//  Progress.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-13.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation

class Progress {
    
    var openedGreySafe, openedColourSafe, removedPainting, tookLadder, tookTealKey,
        tookGoldKey: Bool
    
    init() {
        openedGreySafe = false
        openedColourSafe = false
        removedPainting = false
        tookLadder = false
        tookTealKey = false
        tookGoldKey = false
    }
}
