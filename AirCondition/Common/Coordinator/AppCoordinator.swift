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

    fileprivate let MAP_VIEW_KEY: String  = "MapView"
    fileprivate let STATIONS_LIST_KEY: String  = "StationsList"
    
    var window: UIWindow
    var coordinators = [String:Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
       showStationList()
    }
}

extension AppCoordinator: MapViewCoordinatorDelegate {

    func showStationList() {
        let mapCoordinator = MapViewCoordinator(window: window)
        coordinators[MAP_VIEW_KEY] = mapCoordinator
        mapCoordinator.delegate = self
        mapCoordinator.start()
    }
    
    func mapCoordinatorDidFinish(mapCoordinator: MapViewCoordinator) {
        coordinators[MAP_VIEW_KEY] = nil
        showStationList()
    }
}

extension AppCoordinator: StationListCoordinatorDelegate {
    
    func showList() {
        let stationListCoordinator = StationListCoordinator(window: window)
        coordinators[STATIONS_LIST_KEY] = stationListCoordinator
        stationListCoordinator.delegate = self
        stationListCoordinator.start()
    }
    
    func stationListCoordinatorDidFinish(stationListCoordinator: StationListCoordinator) {
        coordinators[STATIONS_LIST_KEY] = nil
    }
}
