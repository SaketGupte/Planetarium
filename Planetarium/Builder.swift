//
//  Builder.swift
//  Planetarium
//
//  Created by Gupte, Saket (Agoda) on 15/10/18.
//  Copyright © 2018 Saket Gupte. All rights reserved.
//

import UIKit

final class Builder {

    func build() -> UIViewController {

        let viewController = ViewController()
        let interactor = Interactor()
        let presenter = Presenter(interactor: interactor)

        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.view = viewController
        
        return viewController
    }
}
