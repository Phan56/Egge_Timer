//
//  ViewController.swift
//  Egge_Timer
//
//  Created by Phan56 on 17.09.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var timer = Timer()
    var timeEgg = 0
    var player: AVAudioPlayer!
    let stackView = UIStackView()
    let arreyButton = ["soft_egg" : 3, "medium_egg" : 4, "hard_egg" : 7]
    
    let labelText: UILabel = {
        let label = UILabel()
        label.text = "How do you like your eggs ???"
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let progressBar: UIProgressView = {
        let progress = UIProgressView()
        progress.progress = 0.0
        progress.progressViewStyle = .bar
        progress.progressTintColor = .orange
        progress.backgroundColor = .gray
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        
        cinfigureStackView()
        setupView()
    }
    
    func setupView() {
        view.addSubview(labelText)
        view.addSubview(stackView)
        view.addSubview(progressBar)
        
        
        labelText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        labelText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        progressBar.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 100).isActive = true
    }
    
    
    func createButton(named: String) -> UIButton {
        
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: named), for: .normal)
        button.setTitle(named, for: .normal)
        button.setTitleColor(.clear, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = named
        button.addTarget(self, action: #selector(tappedEgge), for: .touchUpInside)
        return button
    }
    

    
    func cinfigureStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for value in arreyButton.enumerated() {
//            print("\(value.element.key)")
            let button = createButton(named: value.element.key)
            stackView.addArrangedSubview(button)
            button.widthAnchor.constraint(equalToConstant: 100).isActive = true
            button.heightAnchor.constraint(equalToConstant: 125).isActive = true
            
        }
    }
    
    @objc func tappedEgge (_ sender: UIButton) {
        
        progressBar.progress = 0
        print(" tipa title \(String(describing: sender.currentTitle)) !!!!")
        guard let titelButton = sender.currentTitle else {return}
        guard let timeEgg = arreyButton[titelButton] else {return}
        self.timeEgg = timeEgg
        switch titelButton {
        case "soft_egg": labelText.text = "Soft"
        case "medium_egg": labelText.text = "Medium"
        case "hard_egg" : labelText.text = "Hard"
        default: labelText.text = "How do you like your eggs ???"
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(progressBarUpdate), userInfo: nil, repeats: true)
        
    }
    
    @objc func progressBarUpdate() {
        print(progressBar.progress)
        
        if progressBar.progress < 1 {
            progressBar.progress = progressBar.progress + (1 / Float(timeEgg))
        }else{
            timer.invalidate()
            labelText.text = "DONE !!!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}

