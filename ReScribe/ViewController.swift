//
//  ViewController.swift
//  ReScribe
//
//  Created by Roydon Jeffrey on 1/26/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var TranscribeTextField: UITextView!
    
    //Declare an audio player
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        spinner.isHidden = true
    }
    
    //To get the user's authorization to record and/or use their voice recordings
    func speechAuthRequest() {
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            
            //Check if the user authorized the access
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                
                //Find the audio using its path with error handling
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        sound.play()
                    }catch {
                        print(error.localizedDescription)
                    }
                    
                    //To analyze the speech in the audio
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) { (result, error) in
                        if let error = error {
                            print("Sorry, we've got a problem here: \(error)")
                        }
                    }
                }
            }
        }
    }
}

