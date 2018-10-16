//
//  ViewController.swift
//  Planetarium
//
//  Created by Gupte, Saket (Agoda) on 3/10/18.
//  Copyright © 2018 Saket Gupte. All rights reserved.
//

import UIKit
import SceneKit
import ARKit


protocol ViewInput: class {
    func render(planets: [PlanetViewModel])
}

class ViewController: UIViewController {

    var sceneView: ARSCNView!
    var presenter: ViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSceneView()
        presenter.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        launchARSession()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pauseARSession()
    }
}

extension ViewController: ViewInput {
    func render(planets: [PlanetViewModel]) {
        showPlanets(viewModels: planets)
    }
}

extension ViewController: ARSCNViewDelegate {}

private extension ViewController {

    func configureSceneView() {
        sceneView = ARSCNView(frame: view.frame)
        sceneView.delegate = self
        sceneView.showsStatistics = true
        view.addSubview(sceneView)
    }

    func launchARSession() {
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }

    func showShip() {
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        sceneView.scene = scene
    }

    func showPlanets(viewModels: [PlanetViewModel]) {

        let scene = SCNScene()
        sceneView.scene = scene

        viewModels.forEach { planetViewModel in
            let planet = createPlanet(with: planetViewModel)
            scene.rootNode.addChildNode(planet)
        }

        func createPlanet(with viewModel: PlanetViewModel) -> SCNNode {
            let planetNode = SCNNode()
            planetNode.geometry = SCNSphere(radius: viewModel.radius)
            planetNode.geometry?.materials = [surface(for: viewModel)]
            planetNode.position = SCNVector3(viewModel.position.xPosition,
                                             viewModel.position.yPosition,
                                             viewModel.position.zPosition)
            return planetNode
        }

        func surface(for viewModel: PlanetViewModel) -> SCNMaterial {
            let material = SCNMaterial()
            material.diffuse.contents = viewModel.image
            return material
        }


    }

    func pauseARSession() {
        sceneView.session.pause()
    }
}
