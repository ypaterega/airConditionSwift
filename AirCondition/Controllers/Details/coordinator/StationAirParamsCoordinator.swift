//
//  StationAirParamsCoordinator.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 13.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import UIKit

protocol StationAirParamslCoordinatorDelegate: class {
   func stationAirParamsCoordinatorDidFinish(stationAirParamsCoordinator: StationAirParamslCoordinator)
}

class StationAirParamslCoordinator: Coordinator {
    
    weak var delegate: StationAirParamslCoordinatorDelegate?
    
    let dataItem: String
    var window: UIWindow
    
    init(window: UIWindow, dataItem: String) {
        self.window = window
        self.dataItem = dataItem
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "StationAirParams") as? StationAirParamsViewController {
            let viewModel = StationAirParamsViewModel()
           // viewModel.model = StationAirParamsModel(stationAirParamslItem: dataItem)
            viewModel.coordinatorDelegate = self
            vc.viewModel = viewModel
            window.rootViewController = vc
        }
    }
}

extension StationAirParamslCoordinator: StationAirParamsViewModelCoordinatorDelegate {
    func stationAirParamsViewModelDidEnd(_ viewModel: StationAirParamsViewModelProtocol) {
        delegate?.stationAirParamsCoordinatorDidFinish(stationAirParamsCoordinator: self)
    }
}

