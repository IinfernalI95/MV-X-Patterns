//
//  GreetingViewControollerBuilder.swift
//  MV(X)Patterns
//
//  Created by Artur on 26.06.2023.
//

import UIKit

class GreetingViewControollerBuilder {
    
    func build() -> UIViewController {
        let viewController = GreetingViewController()
        let person = Person(name: "Tim", surname: "Cook")
        viewController.presenter = GreetingPresenter(view: viewController, person: person)
        
        return viewController
    }
}
