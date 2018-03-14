//
//  MapViewModel.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 14.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

protocol MapViewViewModelViewDelegate: class {

}

protocol MapViewModelCoordinatorDelegate: class {
    func mapViewModelDidLogin(viewModel: MapViewModel)
}

protocol MapModel {
    var viewDelegate: MapViewViewModelViewDelegate? { get set }
    var coordinatorDelegate: MapViewModelCoordinatorDelegate? { get set}
}
