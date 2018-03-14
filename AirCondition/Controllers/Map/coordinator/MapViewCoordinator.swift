//
//  MapViewCoordinator.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 13.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit

protocol MapViewCoordinatorDelegate: class {
    func mapCoordinatorDidFinish(mapCoordinator: MapViewCoordinator)
}

class MapViewCoordinator: Coordinator {
    
    weak var delegate: MapViewCoordinatorDelegate?
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MapView") as? MapViewController {
            let viewModel =  MapViewModel()
            viewModel.coordinatorDelegate = self
            //vc.viewModel = viewModel
            window.rootViewController = vc
        }
    }
}

extension MapViewCoordinator: MapViewModelCoordinatorDelegate {
 
    func mapViewModelDidLogin(viewModel: MapViewModelProtocol) {
        delegate?.mapCoordinatorDidFinish(mapCoordinator: self)
    }
}
