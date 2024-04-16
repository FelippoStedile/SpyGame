//
//  Constants.swift
//  CrownTest
//
//  Created by Felipe  Elsner Silva on 15/04/24.
//

import Foundation
import AVFoundation
import AVFAudio

class Constants: ObservableObject {
    static let shared = Constants()
    
    @Published var correctLocker = [180, 270, 90]
    
    @Published var audioPlayer: AVAudioPlayer?
    func playAudio(audio: String) {
        if let audioURL = Bundle.main.url(forResource: audio, withExtension: "wav") {
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: audioURL) /// make the audio player
                audioPlayer?.play()
                
            } catch {
                print("JORGE Couldn't play audio. Error: \(error)")
            }
            
        } else {
            print("JORGE No audio file found")
        }
    }
}
