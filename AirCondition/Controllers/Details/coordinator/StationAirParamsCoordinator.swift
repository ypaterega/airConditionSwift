//
//  StationAirParamsCoordinator.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 13.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import UIKit
/*
protocol StationAirParamslCoordinatorDelegate: class {
   //func stationAirParamslCoordinatorDidFinish(stationAirParamslCoordinator: stationAirParamslCoordinator)
}

class StationAirParamslCoordinator: Coordinator {
    
    weak var delegate: StationAirParamslCoordinatorDelegate?
    let dataItem: DataItem
    var window: UIWindow
    
    init(window: UIWindow, dataItem: DataItem) {
        self.window = window
        self.dataItem = dataItem
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "MVVM-C", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "StationAirParamsl") as? StationAirParamslViewController {
            let viewModel = StationAirParamslViewModel()
            viewModel.model = StationAirParamslModel(stationAirParamslItem: dataItem)
            viewModel.coordinatorDelegate = self
            vc.viewModel = viewModel
            window.rootViewController = vc
        }
    }
}

extension StationAirParamslCoordinator: StationAirParamslViewModelCoordinatorDelegate {
    
    func stationAirParamslViewModelDidEnd(_ viewModel: StationAirParamslViewModel) {
        delegate?.stationAirParamslCoordinatorDidFinish(stationAirParamslCoordinator: self)
    }
}
*/
