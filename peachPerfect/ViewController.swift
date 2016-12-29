//
//  ViewController.swift
//  peachPerfect
//
//  Created by 오형민 on 2016. 12. 30..
//  Copyright © 2016년 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        stopRecordingButton.isEnabled=false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordButton(_ sender: Any) {
        print("fuck")
        recordingLabel.text="Recording in Progress"
        stopRecordingButton.isEnabled=true
        recordButton.isEnabled=false
        
    }
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!

    @IBAction func stopRecording(_ sender: Any) {
        recordButton.isEnabled=true
        stopRecordingButton.isEnabled=false
        recordingLabel.text="Tap to Record"
        
        
    }

}

