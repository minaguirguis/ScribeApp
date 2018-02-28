//
//  ViewController.swift
//  Scribe
//
//  Created by Mina Guirguis on 2/28/18.
//  Copyright © 2018 Mina Guirguis. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var transcriptionTextField: UITextView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.isHidden = true
        
    }

    func requestSpeechAuth() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                //setting up path to file
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a"){
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound // our audioplayer needs to have sound
                        //it needs to be self because we are going inside a closure here
                        sound.play()
                    } catch {
                        print("Error!")
                    }
                    //^^this imediately starts playing the music
                    let recongizier = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recongizier?.recognitionTask(with: request) { (result, error) in
                        if let error = error {
                            print("There was an error \(error)")
                        } else {
                            print(result?.bestTranscription.formattedString)
                        }
                    
                    }
            //^^^^^parses through the file and takes the speech and converts it to text
                }
            }
        }

    }

    @IBAction func playButtonPressed(_ sender: Any) {
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        requestSpeechAuth()
    }
}
