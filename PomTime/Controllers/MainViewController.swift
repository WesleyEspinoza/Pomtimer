//
//  MainViewController.swift
//  PomTime
//
//  Created by Wesley Espinoza on 2/26/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import UIKit
import MessageUI
import SwiftVideoBackground

class MainViewController: UIViewController {
    var countdownTimer: Timer!
    var pomoTime = 1500
    var currentMode = 1
    
    let backGroundImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.text = "Time for Work"
        return label
    }()
    
    let timerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" Start ", for: .normal)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        return button
    }()
    let pauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" Pause ", for: .normal)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(pauseTimer), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" Reset ", for: .normal)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(endTimer), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM:ss"
        navigationController?.navigationBar.isHidden = true
        view.addSubview(backGroundImageView)
        view.addSubview(timerLabel)
        view.addSubview(startButton)
        view.addSubview(pauseButton)
        view.addSubview(resetButton)
        view.addSubview(mainLabel)
        
        NSLayoutConstraint.activate([
            
                                     backGroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                                     backGroundImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
                                     backGroundImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                                     backGroundImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
                                     timerLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
                                     timerLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0),
                                     timerLabel.heightAnchor.constraint(equalToConstant: 25),
                                     
                                     mainLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
                                     mainLabel.bottomAnchor.constraint(equalTo: timerLabel.topAnchor, constant: -15),
                                     mainLabel.heightAnchor.constraint(equalToConstant: 25),
                                     
                                     startButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 15),
                                     startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
                                     
                                     pauseButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 15),
                                     pauseButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
                                     
                                     
                                     resetButton.topAnchor.constraint(equalTo: pauseButton.bottomAnchor, constant: 15),
                                     resetButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
                                     
                                     ])
        
        fetchNasaJSON { (flag, JsonData) in
            if JsonData.media_type == "image" {
            self.fetchNasaDailyImage(receivedURL: JsonData.hdurl)
        }
        
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        UIView.animate(withDuration: 0.5) {
            self.resetButton.alpha = 1
            self.pauseButton.alpha = 1
        }
    }
    
    @objc func updateTime() {
        timerLabel.text = "\(timeFormatted(pomoTime))"
        
        if pomoTime != 0 {
            pomoTime -= 1
        } else {
            endTimer()
            if currentMode == 1 {
                currentMode = 0
                mainLabel.text = "Time for a break"
            } else {
                currentMode = 1
                mainLabel.text = "Time for work"
            }
            
            switch currentMode {
            case 1:
                    pomoTime = 1500
                    countdownTimer.fire()
            case 0:
                    pomoTime = 300
                    countdownTimer.fire()
            default:
                print("error")
            }
        }
    }
    
    @objc func endTimer() {
        countdownTimer.invalidate()
        pomoTime = 1500
        countdownTimer.fire()
    }
    @objc func pauseTimer() {
        countdownTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    
    func fetchNasaDailyImage(receivedURL: String) {
        
        let defaultSession = URLSession(configuration: .default)
        
        if let url = URL(string: receivedURL) {
            
            let request = URLRequest(url: url)
            // Create Data Task...
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                
                print("data is: ", data!)
                print("response is: ", response!)
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.backGroundImageView.image = image
                    }
                }
            })
            dataTask.resume()
        }
    }
        
        
        typealias CompletionHandler = (_ success:Bool, _ data:NasaInfo) -> Void
        
        func fetchNasaJSON(completionHandler: @escaping CompletionHandler){
            
            let session = URLSession(configuration: .default)
            let jsonURL = "https://api.nasa.gov/planetary/apod?api_key=m1MnbpCt9gyUaKDWQgjt8ODE4CyAtsXv4LmkLAYh"
            let request = URLRequest(url: URL(string: jsonURL)!)
            session.dataTask(with: request) { (data, res, err) in
                
                if let data = data {
                    
                    var flag = true // true if download succeed,false otherwise
                    
                    if err == nil {
                        flag = true
                    } else {
                        flag = false
                    }
                    do {
                        let shipInfo = try JSONDecoder().decode(NasaInfo.self, from: data)
                        DispatchQueue.main.async {
                            completionHandler(flag, shipInfo)
                        }
                    } catch {
                        print("Error is : \n\(error)")
                    }
                }
                
                }.resume()
        }
    
    }

struct NasaInfo: Decodable{
    let hdurl: String
    let media_type: String
    
    private enum codingKeys: String, CodingKey{
        case hdurl = "hdurl"
        case media_type = "media_type"
        }
    }

