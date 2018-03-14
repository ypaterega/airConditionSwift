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
    //var detailCoordinator: DetailCoordinator?
    var window: UIWindow
    var stationListViewController: StationListViewController?
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        stationListViewController = storyboard.instantiateViewController(withIdentifier: "StationList") as? StationListViewController
        
        guard let stationListViewController = stationListViewController else { return }
        
        let viewModel =  StationListViewModel()
        //viewModel.model = StationListModel()
        viewModel.coordinatorDelegate = self as! StationListCoordinatorDelegate
       // stationListViewController.viewModel = viewModel
        window.rootViewController = stationListViewController
    }
}

/*
extension ListCoordinator: StationListViewModelCoordinatorDelegate {
    func listViewModelDidSelectData(_ viewModel: ListViewModel, data: DataItem) {
     //   detailCoordinator = DetailCoordinator(window: window, dataItem: data)
     //   detailCoordinator?.delegate = self
     //   detailCoordinator?.start()
    }
}


extension ListCoordinator: DetailCoordinatorDelegate {
    func detailCoordinatorDidFinish(detailCoordinator: DetailCoordinator)
    {
        self.detailCoordinator = nil
        window.rootViewController = listViewController
    }
}
*/
