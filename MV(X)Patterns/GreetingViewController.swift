//
//  GreetingViewController.swift
//  MV(X)Patterns
//
//  Created by Artur on 20.06.2023.
//

import UIKit

class GreetingViewController: UIViewController {

    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28)
        label.textAlignment = .center
        label.text = "Please Tap To Screen"
        
        return label
    }()
    
    lazy var buttonShow: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showGreetingPressed), for: .touchUpInside)
        button.setTitle("", for: .normal)
        //button.setTitleColor(.black, for: .normal)
        //button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        //button.backgroundColor = .black
        
        return button
    }()
    
    private var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        addConstraints()
        person = Person(name: "Tom", surname: "Reddl")
    }
    
    func addViews() {
        view.addSubview(buttonShow)
        view.addSubview(greetingLabel)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            buttonShow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonShow.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonShow.widthAnchor.constraint(equalTo: view.widthAnchor),
            buttonShow.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greetingLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            greetingLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func showGreetingPressed() {
        //viewModel.showGreeting()
        greetingLabel.text = "Hello, \(person.name)  \(person.surname)!"
    }
}
