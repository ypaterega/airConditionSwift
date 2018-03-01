//
//  StationListCell.swift
//  AirCondition
//
//  Created by Iurii Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit

class StationListCell: UITableViewCell {
    
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    @IBOutlet weak var stationImage: UIImageView!
    
    var viewModel: StationListCellViewModel? {
        didSet {
            setCellViewModel()
        }
    }
    
    func setCellViewModel() {
        stationNameLabel?.text = viewModel?.stationItem.stationName
        cityLabel?.text = viewModel?.stationItem.city
        latitudeLabel?.text = viewModel?.stationItem.gegrLat
        longitudeLabel?.text = viewModel?.stationItem.gegrLon
    }
}

