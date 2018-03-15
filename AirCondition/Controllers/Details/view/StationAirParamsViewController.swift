//
//  StationAirParamsViewController.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 02.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit
import Charts

class StationAirParamsViewController: UIViewController {
    
    var viewModel: StationAirParamsViewModel = StationAirParamsViewModel()
    var dataItem: Int!
    
    @IBOutlet weak var chart: BarChartView!
    @IBOutlet weak var parameterName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        bindViewModel()
        viewModel.onLoad(stationId: dataItem)
    }
    
    private func setupNavBar(){
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 60))
        let navItem = UINavigationItem(title: "Sensor data")
        let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel,
                                   target: nil,
                                   action: #selector(closeDetails))
        navItem.leftBarButtonItem = item
        navBar.setItems([navItem], animated: false)
        
        self.view.addSubview(navBar)
    }
    
    @objc private func closeDetails(){
        viewModel.closeDetails()
    }
    
    private func bindViewModel() {
        viewModel.sensorData.bind() { [weak self] _ in
            self?.setChartData()
        }
    }
    
    private func setChartData() {
        parameterName.text = self.viewModel.sensorData.value.key
    }
}
