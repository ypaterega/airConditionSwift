//
//  StationListModel.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 14.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

protocol StationListViewModelCoordinatorDelegate: class {
     func stationListViewModelDidSelectData(_ viewModel: StationListModelProtocol, data: Int)
}

protocol StationListModelProtocol {
    var coordinatorDelegate: StationListViewModelCoordinatorDelegate? { get set}
}

