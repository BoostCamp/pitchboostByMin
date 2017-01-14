//
//  PlaySoundsViewController.swift
//  peachPerfect
//
//  Created by 오형민 on 2017. 1. 9..
//  Copyright © 2017년 Udacity. All rights reserved.
//

import UIKit
import AVFoundation
import WebKit

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    @IBOutlet weak var Slider: UISlider!
    
    var clickCounter = 0
    static var isPlaying=false
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    var timer : AVAudioPlayer!
    //var webView: WKWebView = WKWebView()
    
    var pitchRateForNode: AVAudioUnitTimePitch!

    
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
        do {
            timer = try AVAudioPlayer(contentsOf: recordedAudioURL as URL)
        }
        catch{
            showAlert(Alerts.AudioFileError, message: String(describing: error))
        }
      
        if clickCounter == 10{
            createAlert(title: "Warning!!", message: "당신의 시간이 \(clickCounter)번 만큼 낭비되고 있습니다")
        }else if clickCounter>=20  {
            createAlert2(title: "이제 그만 놀까요?", message: "UIKit에 대한 멋진 강좌가 당신을 기다리고 있어요!")
        }
        
        
    }
    @IBAction func audioController(_ sender: Any) {
        
        
        //audioPlayerNode.nodeTime(forPlayerTime: AVAudioTime)
        updateCurrentTime()
        
        
        
        
    }
    
    func updateCurrentTime(){
        let playerTime = Slider.value
        //let currentTimeInSec = Int(round(playerTime/pitchRateForNode.rate))
        currentTimeLabel.text=String(playerTime)
        
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
    
    
    
    
    
    
    
    
    
    
    
    
    func createAlert (title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:{ (action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
    func createAlert2 (title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        //https://classroom.udacity.com/courses/ud788/lessons/3499758725/concepts/36175187290923#
        func openPageTowardUdacityUICource(action: UIAlertAction) {
            if let url = URL(string: "https://classroom.udacity.com/courses/ud788/lessons/3499758725/concepts/36175187290923#"){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else { print("fuckYou")
            }
        }
        
        alert.addAction(UIAlertAction(title:"Go for it!", style: UIAlertActionStyle.default, handler:openPageTowardUdacityUICource))
        alert.addAction(UIAlertAction(title:"No Thanks", style: UIAlertActionStyle.default, handler:{ (action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
}
