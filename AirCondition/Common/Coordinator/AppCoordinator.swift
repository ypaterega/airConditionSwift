//
//  AppCoordinator.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 13.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {

    fileprivate let STATION_LIST_KEY: String  = "StationList"
    fileprivate let STATION_AIR_PARAMS_KEY: String  = "StationAirParams"
    fileprivate let MAP_VIEW_KEY: String  = "MapView"
    
    var window: UIWindow
    var coordinators = [String:Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
       showStationList()
    }
}

extension AppCoordinator: StationListCoordinatorDelegate {

    func showStationList() {
        let stationListCoordinator = StationListCoordinator(window: window)
        coordinators[STATION_LIST_KEY] = stationListCoordinator
        stationListCoordinator.delegate = self
        stationListCoordinator.start()
    }
    
    func stationListCoordinatorDidFinish(stationListCoordinator: StationListCoordinator) {
        coordinators[STATION_LIST_KEY] = nil
    }
}
