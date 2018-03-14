//
//  StationAirParamsModel.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 14.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

protocol StationAirParamsViewModelCoordinatorDelegate: class {
    func stationAirParamsViewModelDidEnd(_ viewModel: StationAirParamsViewModelProtocol)
}

protocol StationAirParamsViewModelProtocol {
    var coordinatorDelegate: StationAirParamsViewModelCoordinatorDelegate? { get set}
    var stationAirParams: String? { get }
}
