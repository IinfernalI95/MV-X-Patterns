//
//  ViewController.swift
//  MV(X)Patterns
//
//  Created by Artur on 20.06.2023.
//

import UIKit

protocol GreetingViewProtocol: AnyObject {
    func setGreeting(_ greeting: String)
}

class GreetingViewController: UIViewController {

    lazy var greetingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Please tap to screen", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.addTarget(self, action: #selector(showGreetingPressed), for: .touchUpInside)
        
        return button
    }()
    
    var presenter: GreetingPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        view.backgroundColor = .yellow
        
    }
    
    @objc func showGreetingPressed() {
        presenter.showGreeting()
    }
    
    private func addViews() {
        view.addSubview(greetingButton)
        
        NSLayoutConstraint.activate([
            greetingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greetingButton.heightAnchor.constraint(equalTo: view.heightAnchor),
            greetingButton.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}

extension GreetingViewController: GreetingViewProtocol {
    func setGreeting(_ greeting: String) {
        greetingButton.setTitle(greeting, for: .normal)
    }
}

