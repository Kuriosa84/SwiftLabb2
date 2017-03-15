//
//  Sound.swift
//  SwiftLabb2
//
//  Created by Asa Kwarnmark on 2017-03-15.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

import Foundation
import AVFoundation

class Sound {
    
    static var soundPlayer : AVAudioPlayer!
    static var backgroundMusicPlayer : AVAudioPlayer!
    
    static func playClickSound() {
        let soundURL = Bundle.main.url(forResource: "clicksound", withExtension: "mp3")!
        do {
            try Sound.soundPlayer = AVAudioPlayer(contentsOf: soundURL)
        } catch {}
        Sound.soundPlayer.volume = 1.0
        Sound.soundPlayer.numberOfLoops = 0
        Sound.soundPlayer.prepareToPlay()
        Sound.soundPlayer.play()
    }
    
    static func playBackgroundMusic() {
        let bgMusicURL = Bundle.main.url(forResource: "spacecoast", withExtension: "mp3")!
        do {
            try Sound.backgroundMusicPlayer = AVAudioPlayer(contentsOf: bgMusicURL)
        } catch {}
        Sound.backgroundMusicPlayer.numberOfLoops = -1
        Sound.backgroundMusicPlayer.volume = 0.4
        Sound.backgroundMusicPlayer.prepareToPlay()
        Sound.backgroundMusicPlayer.play()
    }
    
    static func playFinalMusic() {
        let bgMusicURL = Bundle.main.url(forResource: "gettingthere", withExtension: "mp3")!
        do {
            try Sound.backgroundMusicPlayer = AVAudioPlayer(contentsOf: bgMusicURL)
        } catch {}
        Sound.backgroundMusicPlayer.numberOfLoops = -1
        Sound.backgroundMusicPlayer.volume = 0.6
        Sound.backgroundMusicPlayer.prepareToPlay()
        Sound.backgroundMusicPlayer.play()
    }
}
