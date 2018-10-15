//
//  Planets.swift
//  Planetarium
//
//  Created by Gupte, Saket (Agoda) on 15/10/18.
//  Copyright © 2018 Saket Gupte. All rights reserved.
//

import Foundation

typealias Radius = Double
typealias AxisPosition = Double

struct Planet {
    let name: String
    let position: Coordinates
    let radius: Radius
    let spinSpeed: Int
}

struct Coordinates {
    let xPosition: AxisPosition
    let yPosition: AxisPosition
    let zPosition: AxisPosition
}
