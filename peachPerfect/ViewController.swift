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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordButton(_ sender: Any) {
        print("fuck")
        recordingLabel.text="Recording in Progress"
    }
    @IBOutlet weak var recordingLabel: UILabel!

    @IBAction func stopRecording(_ sender: Any) {
        
        
        
    }

}

