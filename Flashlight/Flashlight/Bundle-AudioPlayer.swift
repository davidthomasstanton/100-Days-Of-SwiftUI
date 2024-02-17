//
//  Bundle-AudioPlayer.swift
//  Flashlight
//
//  Created by David Stanton on 2/17/24.
//

import AVFoundation

extension Bundle {
    func audioPlayer(for filename: String, volume: Double = 1.0) -> AVAudioPlayer {
        guard let audioURL = url(forResource: filename, withExtension: nil) else {
            fatalError("Can't fine \(filename) in app bundle")
        }
        
        guard let player = try? AVAudioPlayer(contentsOf: audioURL) else {
            fatalError("Failed to load \(filename) into audio player.")
        }
        
        player.volume = Float(volume)
        player.prepareToPlay()
        
        return player
    }
}

