//
//  StationListCoordinator.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 13.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit

protocol StationListCoordinatorDelegate: class {
    func stationListCoordinatorDidFinish(stationListCoordinator: StationListCoordinator)
}

class StationListCoordinator: Coordinator {
    weak var delegate: StationListCoordinatorDelegate?
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "StationList") as? StationListViewController {
            let viewModel =  StationListViewModel()
            viewModel.coordinatorDelegate = self
            vc.viewModel = viewModel
            window.rootViewController = vc
        }
    }
}

extension StationListCoordinator: StationDetailsViewModelCoordinatorDelegate {
    func stationDetailsViewModel(viewModel: StationDetailsViewModel) {
        delegate?.stationListCoordinatorDidFinish(stationListCoordinator: self)
    }
}
