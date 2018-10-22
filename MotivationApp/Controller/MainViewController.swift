////
////  ViewController.swift
////  MotivationApp
////
////  Created by Euijae Hong on 28/09/2018.
////  Copyright © 2018 JAEJIN. All rights reserved.
////
//
//import UIKit
//import SnapKit
//import AVFoundation
//
//
//enum Status {
//    
//    case Stop
//    case Record
//    case Play
//    
//}
//
//
//class MainViewController: UIViewController {
//    
//    // UI
//    let timerLabel : UILabel = {
//        
//        let t = UILabel()
//        t.text = "00:00:01"
//        t.textColor = .black
//        t.textAlignment = .center
//        t.font = UIFont.preferredFont(forTextStyle: .headline)
//        
//        return t
//    }()
//    
//    let customView = CustomView()
//    
//    
//    // Data
//    var audioSession : AVAudioSession?
//    var audioRecorder : AVAudioRecorder?
//    var audioPlayer : AVAudioPlayer?
//    var status = Status.Stop
//    
//}
//
//
////MARK:- Life Cycle
//extension MainViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        
//        view.backgroundColor = .white
//        
//        [
//            timerLabel,
//            customView
//            
//        ].forEach{view.addSubview($0)}
//        
//        setupRecoringSession()
//        setupRecoder()
//        setupActions()
//        
//        
//        
//        
//        
//    }
//    
//    override func updateViewConstraints() {
//        super.updateViewConstraints()
//        
//        timerLabel.snp.makeConstraints{
//            
//            $0.top.equalToSuperview()
//            $0.leading.equalToSuperview()
//            $0.trailing.equalToSuperview()
//            $0.bottom.equalTo(customView.snp.top)
//            
//            
//        }
//        
//        customView.snp.makeConstraints{
//            
//            $0.height.equalTo(view.frame.height/3)
//            $0.bottom.equalToSuperview()
//            $0.leading.equalToSuperview()
//            $0.trailing.equalToSuperview()
//            
//        }
//        
//    }
//    
//}
//
//
////MARK:- AVAudioRecorderDelegate & AVAudioPlayerDelegate
//extension MainViewController : AVAudioRecorderDelegate,AVAudioPlayerDelegate {
//    
//    fileprivate func setupRecoringSession() {
//        
//        self.audioSession = AVAudioSession.sharedInstance()
//        
//        do {
//            
//            try audioSession?.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
//            
////            audioSession?.requestRecordPermission({[unowned self] (allowed) in
////
////            })
//            
//        } catch {
//            
//        }
//    
//    }
//
//    
//    fileprivate func getDocumentsDirector() -> URL {
//        
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let documentDirectory = paths[0]
//        
//        return documentDirectory
//        
//    }
//    
//    
//    fileprivate func getFileUrl() -> URL {
//        
//        let fileName = "showme.m4a"
//        let filePath = getDocumentsDirector().appendingPathComponent(fileName)
//        
//        return filePath
//    
//        
//    }
//    
//    fileprivate func setupRecoder() {
//        
//        let audioFileName = getFileUrl()
//        let recordSetting = [ AVFormatIDKey : kAudioFormatAppleLossless,
//                              AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
//                              AVEncoderBitRateKey : 1500,
//                              AVNumberOfChannelsKey : 2,
//                              AVSampleRateKey : 12000 ] as [String : Any]
//        
//        
//        do {
//
//            self.audioRecorder = try AVAudioRecorder(url: audioFileName, settings: recordSetting)
//            self.audioRecorder?.delegate = self
//            self.audioRecorder?.prepareToRecord()
//            
//        } catch {
//            
//            print(error.localizedDescription)
//            
//        }
//        
//        
//        
//    }
//    
//    fileprivate func setupPlayer() {
//        
//        let audioFileName = getFileUrl()
//        
//        do {
//            
//            self.audioPlayer = try AVAudioPlayer(contentsOf: audioFileName)
//            self.audioPlayer?.delegate = self
//            self.audioPlayer?.prepareToPlay()
//            self.audioPlayer?.volume = 1.0
//            let duration = self.audioPlayer?.duration
//            print(duration!)
//        } catch  {
//            print(error)
//        }
//    }
//    
//    
//    
//    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
//        
//        
//        print("flag :",flag)
//        customView.playerButton.isEnabled = true
//        
//    }
//    
//    
//    
//    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        
//        customView.recoderButton.isEnabled = true
//        
//    }
//    
//    
//    
//}
//
//
////MARK:- Actions
//extension MainViewController {
//    
//    fileprivate func setupActions() {
//        
//        customView.recoderButton.addTarget(self, action: #selector(tappedRecordButton(sender:)), for: .touchUpInside)
//        customView.playerButton.addTarget(self, action: #selector(tappedPlayButton(sender:)), for: .touchUpInside)
//    
//    }
//    
//    @objc fileprivate func tappedRecordButton(sender:UIButton) {
//        
//        switch status {
//            
//        case .Stop:
//            
//            self.audioRecorder?.record()
//            self.customView.playerButton.isEnabled = false
//            self.customView.recoderButton.setTitle("정지", for: .normal)
//            self.status = .Record
//            
//            break
//            
//        case .Record:
//            
//            self.audioRecorder?.stop()
//            self.customView.playerButton.isEnabled = true
//            self.customView.recoderButton.setTitle("녹음", for: .normal)
//            self.status = .Stop
//            
////            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//            
//            break
//            
//        case .Play:
//            
//            break
//    
//        }
//        
//    
//    }
//    
//    
//    
//    @objc fileprivate func tappedPlayButton(sender:UIButton) {
//        
//        setupPlayer()
//        self.audioPlayer?.play()
//        
//        
//    }
//    
//
//    
//}
//
//extension MainViewController {
//    
//}
//
//
