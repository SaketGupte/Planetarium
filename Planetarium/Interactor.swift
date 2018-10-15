//
//  Interactor.swift
//  Planetarium
//
//  Created by Gupte, Saket (Agoda) on 15/10/18.
//  Copyright © 2018 Saket Gupte. All rights reserved.
//

import Foundation

protocol InteractorInput {
    func fetchPlanets()
}


final class Interactor {

    weak var presenter: InteractorOutput?

}

extension Interactor: InteractorInput {

    func fetchPlanets() {
        presenter?.present(planets: [])
    }

}
