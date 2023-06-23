//
//  GreetingViewController.swift
//  MV(X)Patterns
//
//  Created by Artur on 20.06.2023.
//

import UIKit

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
    
    private var viewModel: GreetingViewModelProtocol! {
        didSet {
            viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingButton.setTitle(viewModel.greeting, for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        
        let person = Person(name: "Tim", surname: "Cook")
        viewModel = GreetingViewModel(person: person)
        //greetingButton.addTarget(viewModel, action: #selector(viewModel.showGreeting), for: .touchUpInside)
    }
    
    @objc func showGreetingPressed() {
        viewModel.showGreeting()
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
