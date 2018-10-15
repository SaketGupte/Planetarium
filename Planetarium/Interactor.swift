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
        presenter?.present(planets: [sun(), earth()])
    }

    func earth() -> Planet {

        let coordinates = Coordinates(xPosition: 0, yPosition: 0, zPosition: 0)

        return Planet(name: "Earth",
                      position: coordinates,
                      radius: 0.5,
                      spinSpeed: 0,
                      image: #imageLiteral(resourceName: "Earth.jpg"))
    }

    func sun() -> Planet {
        let coordinates = Coordinates(xPosition: 0, yPosition: 0, zPosition: -1)
        return Planet(name: "Sun", position: coordinates, radius: 1, spinSpeed: 0, image: #imageLiteral(resourceName: "Sun.jpg"))
    }

}
