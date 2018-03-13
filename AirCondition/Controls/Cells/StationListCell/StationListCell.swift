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
    
    /*
     
     func setName(_ name: String) {
     nameLabel.text = name
     }
     
     func setDescription(_ description: String) {
     descriptionLabel.text = description
     }
     
     func setStarsCountTest(_ starsText: String) {
     starsLabel.text = starsText
     }
     
     func setSize(_ sizeText: String) {
     sizeLabel.text = sizeText
     }
     
     func setWatchers(_ watchersText: String) {
     watchersLabel.text = watchersText
     }
     
    */
    
    func setCellViewModel() {
    
        stationImage.image = UIImage(named: "ic_place")
        
        let attributes : [NSAttributedStringKey : Any] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue) : UIFont.systemFont(ofSize: 12.0),
                                                          NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : UIColor.black]
        
        if let stationItem =  viewModel?.stationItem {
    
            stationNameLabel?.attributedText =  NSAttributedString(string: stationItem.stationName!, attributes: attributes)
            cityLabel?.attributedText = NSAttributedString(string: stationItem.city!, attributes: attributes)
            latitudeLabel?.attributedText = NSAttributedString(string: stationItem.gegrLat!, attributes: attributes)
            longitudeLabel?.attributedText = NSAttributedString(string: stationItem.gegrLon!, attributes: attributes)
    
        }
    }
}

