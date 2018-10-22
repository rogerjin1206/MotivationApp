//
//  AlarmViewController.swift
//  MotivationApp
//
//  Created by Euijae Hong on 01/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import UserNotifications
import AVFoundation


class AlarmViewController : UIViewController {
    
    var audioSession : AVAudioSession?
    var audioRecorder : AVAudioRecorder?
    var audioPlayer : AVAudioPlayer?
    
    let backgroundImageView : UIImageView = {
        
        let iv = UIImageView()
        iv.image = UIImage(named: "background_1")
        
        return iv
        
    }()
    
    let menuButton : UIButton = {
        
        let b = UIButton()
        b.addTarget(self, action: #selector(goToConfigurationVC), for: .touchUpInside)
        b.backgroundColor = .yellow
        
        return b
        
    }()
    
    let createAlarmButton : UIButton = {
        
        let b = UIButton()
        b.addTarget(self, action: #selector(goToSettingAlarmVC), for: .touchUpInside)
        b.backgroundColor = .yellow
        return b
        
    }()
    
    lazy var tableView : UITableView = {
        
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.registerCell(ofType:AlarmCell.self)
        
        return tv
        
    }()
    
}



extension AlarmViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let app = UIApplication.shared
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert], completionHandler: { (didAllow, error) in
            
        })
        
        UNUserNotificationCenter.current().delegate = self
    
        let content = UNMutableNotificationContent()
        content.title = "Noti Title"
        content.body = "Noti Body"
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = 2018
        dateComponents.month = 10
        dateComponents.day = 22
        dateComponents.hour = 15
        dateComponents.minute = 45
        
        
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier:"timerdone", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        
        center.add(request) { (error) in
            print(error?.localizedDescription ?? "")
        }

        setupViews()
        

    }
    
}


//MARK:- SetupViews
extension AlarmViewController {
    

    
    fileprivate func setupViews() {
        

        
        [
            backgroundImageView,
            menuButton,
            createAlarmButton,
            tableView
            
            ].forEach{view.addSubview($0)}
        
        
        backgroundImageView.snp.makeConstraints({
            
            $0.edges.equalToSuperview()
            
        })
        
        menuButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.equalToSuperview().offset(24)
            $0.size.equalTo(40)
        }
        
        createAlarmButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.size.equalTo(40)
        }
        
        
        tableView.snp.makeConstraints {
            
            $0.height.equalTo(view.frame.height/2+18)
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            
        }
    
    }
    
    
    
}


//MARK: UITableViewDelegate  & UITableViewDataSource
extension AlarmViewController : UITableViewDelegate , UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(ofType: AlarmCell.self, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 107
        
    }
    
    
}


//MARK:- Actions
extension AlarmViewController {
    
    @objc fileprivate func goToSettingAlarmVC() {
        
        let settingAlarmVC = SettingAlarmViewController()
        
        settingAlarmVC.modalPresentationStyle = .overCurrentContext
        
        self.present(settingAlarmVC, animated: true, completion: nil)
        

        
    }
    
    @objc fileprivate func goToConfigurationVC() {
        
        let configurationVC = ConfigurationViewController()
        
        configurationVC.modalPresentationStyle = .overCurrentContext
        //        selectBackgroundVC.delegate = self
        
        self.present(configurationVC, animated: true, completion: nil)
        
        
        
    }
    
}

extension AlarmViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
//        let settingsViewController = UIViewController()
//        settingsViewController.view.backgroundColor = .gray
//        self.present(settingsViewController, animated: true, completion: nil)
        
    }
    
    func scheduleNotification(date:String , time: String , subject:String) {
        
        var dateString = date+" "+time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        let convertedDate = dateFormatter.date(from: dateString)!
        
        let subtractTime = Calendar.current.date(byAdding: .minute, value: -10, to: convertedDate)
        
        dateString = dateFormatter.string(from: subtractTime!)
        
        var localTimeZoneName: String { return TimeZone.current.identifier }
        var secondsFromGMT: Int { return TimeZone.current.secondsFromGMT() }
        dateFormatter.timeZone = TimeZone(secondsFromGMT: secondsFromGMT)
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        let dateObj:Date = dateFormatter.date(from: dateString)!
        
        print("alaram time  : \(dateObj)")
        
        let triggerDaily = Calendar.current.dateComponents([.day,.month,.year,.hour,.minute,], from: dateObj)
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        
        let alarmId = UUID().uuidString
        
        let content = UNMutableNotificationContent()
        content.title = "your title"
        content.body = subject
        content.sound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "first.mp3"))
        content.categoryIdentifier = alarmId
        
        let request = UNNotificationRequest(identifier: alarmId, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request) {(error) in
            
            if let error = error {
                print("Uh oh! i had an error: \(error)")
            }
        }
    }
    
    

    
    
}

extension AlarmViewController : AVAudioPlayerDelegate {
    
    func playSound(_ soundName: String) {
        
        //vibrate phone first
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        //set vibrate callback
        AudioServicesAddSystemSoundCompletion(SystemSoundID(kSystemSoundID_Vibrate),nil,
                                              nil,
                                              { (_:SystemSoundID, _:UnsafeMutableRawPointer?) -> Void in
                                                print("callback", terminator: "") //todo
        },
                                              nil)
        let url = URL(
            fileURLWithPath: Bundle.main.path(forResource: soundName, ofType: "mp3")!)
        
        var error: NSError?
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch let error1 as NSError {
            error = error1
            audioPlayer = nil
        }
        
        if let err = error {
            print("audioPlayer error \(err.localizedDescription)")
        } else {
            audioPlayer!.delegate = self
            audioPlayer!.prepareToPlay()
        }
        //negative number means loop infinity
        audioPlayer!.numberOfLoops = -1
        audioPlayer!.play()
    }
    
}



