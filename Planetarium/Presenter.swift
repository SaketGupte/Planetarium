//
//  Presenter.swift
//  Planetarium
//
//  Created by Gupte, Saket (Agoda) on 15/10/18.
//  Copyright © 2018 Saket Gupte. All rights reserved.
//

import UIKit

protocol ViewOutput {
    func viewIsReady()
}

protocol InteractorOutput: class {
    func present(planets: [Planet])
}

final class Presenter {

    var viewModels: [PlanetViewModel] = []
    var interactor: InteractorInput
    weak var view: ViewInput?

    init(interactor: InteractorInput) {
        self.interactor = interactor
    }
}

extension Presenter: ViewOutput {

    func viewIsReady() {
        interactor.fetchPlanets()
    }

}

extension Presenter: InteractorOutput {

    func present(planets: [Planet]) {
        view?.render(planets: map(planets: planets))
    }
}

private extension Presenter {

    func map(planets: [Planet]) -> [PlanetViewModel] {
        return planets.compactMap { planet -> PlanetViewModel in
            return PlanetViewModel(position: planet.position,
                                   image: planet.image,
                                   radius: planet.radius,
                                   spinSpeed: planet.spinSpeed)
        }
    }
}

struct PlanetViewModel {

    let position: Coordinates
    let image: UIImage
    let radius: Radius
    let spinSpeed: Int
}
