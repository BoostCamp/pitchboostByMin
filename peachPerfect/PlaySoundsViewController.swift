//
//  PlaySoundsViewController.swift
//  peachPerfect
//
//  Created by 오형민 on 2017. 1. 9..
//  Copyright © 2017년 Udacity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var clickCounter = 0
    static var isPlaying=false
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play Sound Button Pressed")
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
            clickCounter+=1
        case .fast:
            playSound(rate: 1.5)
            clickCounter+=1

        case .chipmunk:
            playSound(pitch: 1000)
            clickCounter+=1

        case .vader:
            playSound(pitch: -1000)
            clickCounter+=1

        case .echo:
            playSound(echo: true)
            clickCounter+=1

        case .reverb:
            playSound(reverb: true)
            clickCounter+=1

            
        }
        print(clickCounter)
        configureUI(.playing)
      
        if clickCounter == 20{
            
        }else if clickCounter>=30 {
            
        }
        
        
    }
    
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        
        stopAudio()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupAudio()
       
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
     
    }
   
}
