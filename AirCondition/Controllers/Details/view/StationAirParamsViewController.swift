//
//  StationAirParamsViewController.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 02.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit

class StationAirParamsViewController: UIViewController {
    
    var viewModel: StationAirParamsViewModel = StationAirParamsViewModel()
    var dataItem: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.onLoad(stationId: dataItem)
    }
    
    private func bindViewModel() {
        viewModel.stationAirParamsListCells.bind() { [weak self] _ in
            
        }
    }
}
