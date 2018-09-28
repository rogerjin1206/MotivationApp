//
//  ViewController.swift
//  MotivationApp
//
//  Created by Euijae Hong on 28/09/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation


class MainViewController: UIViewController {
    
    var time = 0
    
    let timerLabel : UILabel = {
        
        let t = UILabel()
        t.text = "0"
        t.textColor = .black
        t.textAlignment = .center
        t.font = UIFont.preferredFont(forTextStyle: .headline)
        
        return t
    }()
    let customView = CustomView()
    
    var audioRecorder : AVAudioRecorder?
    var audioPlayer : AVAudioPlayer?
    
    
    var fileName = "audioFile.m4a"
    
    

}


//MARK:- Life Cycle
extension MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [
            timerLabel,
            customView
            
        ].forEach{view.addSubview($0)}
        
        customView.recoderButton.addTarget(self, action: #selector(tappedRecordButton(sender:)), for: .touchUpInside)
        customView.playerButton.addTarget(self, action: #selector(tappedPlayButton(sender:)), for: .touchUpInside)
        
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        timerLabel.snp.makeConstraints{
            
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(customView.snp.top)
            
            
        }
        
        customView.snp.makeConstraints{
            
            $0.height.equalTo(view.frame.height/3)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            
        }
        
    }
    
}

extension MainViewController : AVAudioRecorderDelegate,AVAudioPlayerDelegate {
    
    fileprivate func getDocumentsDirector() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        
    }
    
    fileprivate func setupRecoder() {
        
        let audioFileName = getDocumentsDirector().appendingPathComponent(fileName)
        let recordSetting = [ AVFormatIDKey : kAudioFormatAppleLossless,
                              AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
                              AVEncoderBitRateKey : 320000,
                              AVNumberOfChannelsKey : 2,
                              AVSampleRateKey : 44100.2 ] as [String:Any]
        
        
        do {
            
            self.audioRecorder = try AVAudioRecorder(url: audioFileName, settings: recordSetting )
            self.audioRecorder?.delegate = self
            self.audioRecorder?.prepareToRecord()
            
        } catch {
            
            print(error.localizedDescription)
            
        }
        
        
        
    }
    
    fileprivate func setupPlayer() {
        
        let audioFileName = getDocumentsDirector().appendingPathComponent(fileName)
        
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: audioFileName)
            self.audioPlayer?.delegate = self
            self.audioPlayer?.prepareToPlay()
            self.audioPlayer?.volume = 1.0
        } catch  {
            print(error)
        }
    }
    
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        customView.playerButton.isEnabled = true
        
    }
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        customView.recoderButton.isEnabled = true
        
    }
    
    
    
}

extension MainViewController {
    
    
    @objc fileprivate func tappedRecordButton(sender:UIButton) {
        
        let timer : Timer?
        
        timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(timerRunning), userInfo: nil, repeats: true)
        
    }
    
    
    
    @objc fileprivate func tappedPlayButton(sender:UIButton) {
        
        
    }
    
    
    @objc fileprivate func timerRunning() {
        
        time += 1
        self.timerLabel.text = "\(time)"
        
    }
    
    
    
}

extension MainViewController {
    
}


