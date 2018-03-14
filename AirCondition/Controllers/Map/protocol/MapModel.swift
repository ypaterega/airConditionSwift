//
//  MapModel.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 14.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

protocol MapViewModelCoordinatorDelegate: class {
    func mapViewModelDidLogin(viewModel: MapViewModelProtocol)
}

protocol MapViewModelProtocol {
    var coordinatorDelegate: MapViewModelCoordinatorDelegate? { get set}
}
