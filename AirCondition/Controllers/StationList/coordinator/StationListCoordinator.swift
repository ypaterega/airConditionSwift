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
    
    init(window: UIWindow) {
        self.window = window
    }
    
    weak var delegate: StationListCoordinatorDelegate?
    var detailCoordinator: StationAirParamslCoordinator?
    
    var window: UIWindow
    var stationListViewController: StationListViewController?
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        stationListViewController = storyboard.instantiateViewController(withIdentifier: "StationList") as? StationListViewController
        
        guard let stationListViewController = stationListViewController else { return }
        
        let viewModel =  StationListViewModel()
        viewModel.coordinatorDelegate = self
        stationListViewController.viewModel = viewModel
        window.rootViewController = stationListViewController
    }
}

extension StationListCoordinator: StationListViewModelCoordinatorDelegate {
    func stationListViewModelDidSelectData(_ viewModel: StationListModelProtocol,
                                           data: String) {
        detailCoordinator = StationAirParamslCoordinator(window: window,
                                                         dataItem: data)
        detailCoordinator?.delegate = self
        detailCoordinator?.start()
    }
}

extension StationListCoordinator: StationAirParamslCoordinatorDelegate {
    func stationAirParamsCoordinatorDidFinish(stationAirParamsCoordinator: StationAirParamslCoordinator) {
        self.detailCoordinator = nil
        window.rootViewController = stationListViewController
    }
}
