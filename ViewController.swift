//
//  ViewController.swift
//  Egge_Timer
//
//  Created by Phan56 on 17.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    let stackView = UIStackView()
    
    let arreyBuuton = ["soft", "medium", "hard"]
    
    let testButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "hard_egg"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        return button
    }()
    
    let testButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "hard_egg"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        return button
    }()
    
    let testButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "hard_egg"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        return button
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
        
//        labelText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 15).isActive = true
        labelText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        labelText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        
        stackView.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        
        testButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        testButton.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
        testButton1.accessibilityFrame
        
    }
    
    func cinfigureStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 10
//        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.backgroundColor = .darkGray
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(testButton)
        stackView.addArrangedSubview(testButton1)
//        stackView.addArrangedSubview(testButton2)
    }
    
    @objc func tappedEgge (_ sender: UIButton) {
        
    }


}

