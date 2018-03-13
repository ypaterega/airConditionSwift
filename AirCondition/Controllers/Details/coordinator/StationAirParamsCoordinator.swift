//
//  StationAirParamsCoordinator.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 13.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit

protocol StationAirParamsCoordinatorDelegate: class {
  
}

class StationAirParamsCoordinator: Coordinator {
    weak var delegate: StationAirParamsCoordinatorDelegate?
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "StationAirParams") as? StationAirParamsViewController {
            let viewModel =  StationAirParamsViewModel()
            viewModel.coordinatorDelegate = self
            vc.viewModel = viewModel
            window.rootViewController = vc
        }
    }
}

extension StationAirParamsCoordinatorCoordinator: StationDetailsViewModelCoordinatorDelegate {
    func stationDetailsViewModel(viewModel: StationDetailsViewModel) {
        delegate?.stationListCoordinatorDidFinish(stationListCoordinator: self)
    }
}
