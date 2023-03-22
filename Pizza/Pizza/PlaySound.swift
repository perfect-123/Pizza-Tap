//
//  PlaySound.swift
//  Pizza
//
//  Created by Perfect Ackah on 3/1/23.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?
var interactSound: AVAudioPlayer?
var player: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}


func instantSound(sound: String, type: String){
    if let musicFile = Bundle.main.path(forResource: sound, ofType: type){
        do{
            interactSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicFile))
            interactSound?.play()
            
        } catch{
            print("This don't dont work")
        }
    }
}
