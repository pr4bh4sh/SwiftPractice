//
//  RecordSoundViewController.swift
//  PitchPerfect
//
//  Created by Prabhash Singh on 27/07/17.
//  Copyright © 2017 automationlog. All rights reserved.
//


import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {

  //outlet and vars

  var audioRecorder: AVAudioRecorder!


  @IBOutlet weak var recordingLable: UILabel!
  @IBOutlet weak var recordBtn: UIButton!
  @IBOutlet weak var stopBtn: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
//    self.view.backgroundColor = UIColor.lightGray
    stopBtn.isEnabled = false
  }


  //Actions and func
  @IBAction func record(_ sender: UIButton) {
//    print(sender.titleLabel!.text!)
//    print(sender.tag)
    recordingLable.text = "Recording in progress"
    stopBtn.isEnabled = true
    recordBtn.isEnabled = false

    let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
    let recordingName = "recordedVoice.wav"
    let pathArray = [dirPath, recordingName]
    let filePath = URL(string: pathArray.joined(separator: "/"))

    let session = AVAudioSession.sharedInstance()
    try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)

    try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
    audioRecorder.delegate = self
    audioRecorder.isMeteringEnabled = true
    audioRecorder.prepareToRecord()
    audioRecorder.record()
    print(filePath!)
  }
  
  @IBAction func stopRecording(_ sender: Any) {
//    print("stop recording")
    recordingLable.text = "Recording stopped"
    recordBtn.isEnabled = true
    stopBtn.isEnabled = false

    audioRecorder.stop()
    let audioSession = AVAudioSession.sharedInstance()
    try! audioSession.setActive(false)
  }

  func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {

    if flag{
      print("findished recording")
      performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
    }
    else{
      print("recording was not successfull")
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "stopRecording" {
      let playSoundVC = segue.destination as! PlaySoundViewController
      let  recordedAudioUrl = sender as! URL
      playSoundVC.recordedAudioURL = recordedAudioUrl

    }
  }


}

