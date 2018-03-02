//
//  StationAirParamsCell.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 02.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit

class StationAirParamsCell : UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var value: UILabel!

    var viewModel: StationAirParamsCellViewModel? {
        didSet {
            setCellViewModel()
        }
    }
    
    func setCellViewModel() {
        
        let attributes : [NSAttributedStringKey : Any] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue) : UIFont.systemFont(ofSize: 12.0),
                                                          NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : UIColor.black]
        
        if let stationItem =  viewModel?.stationParamsItem {
            
            title?.attributedText =  NSAttributedString(string: stationItem.title, attributes: attributes)
            value?.attributedText = NSAttributedString(string: stationItem.value, attributes: attributes)
        }
    }
}
