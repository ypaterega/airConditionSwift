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

class StationAirParamsViewController: UIViewController, ChartViewDelegate {
    
    var viewModel: StationAirParamsViewModel = StationAirParamsViewModel()
    var dataItem: Int!
    
    @IBOutlet weak var chart: BarChartView!
    @IBOutlet weak var parameterName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        bindViewModel()
        
        chart.delegate = self
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
        viewModel.sensorData.bindAndFire() { [weak self] _ in
            self?.setChartData()
        }
    }
    
    private func setChartData() {
        parameterName.text = self.viewModel.sensorData.value.key
        
        chart.noDataText = "Error 404 - something wrong"
        
        var dataEntries: [BarChartDataEntry] = []
        var chartsDateData = [String]()
        
        let chartSensorData = self.viewModel.sensorData.value
        
        for i in 0..<chartSensorData.values.count {
            let dataEntry = BarChartDataEntry(x: Double(i),
                                              yValues: [Double(chartSensorData.values[i].value)])
            chartsDateData.append(chartSensorData.values[i].date) //Dont know how set on x-axis
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "data")
        let chartData = BarChartData(dataSet: chartDataSet)
        chart.data = chartData
    }
}
