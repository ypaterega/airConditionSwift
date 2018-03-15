//
//  StationListViewController.swift
//  AirCondition
//
//  Created by Iurii Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit

class StationListViewController: UITableViewController {
    
    var viewModel: StationListViewModel = StationListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.onLoad()
    }
    
    override func viewDidLayoutSubviews(){
    
    }
    
    private func setupNavBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 60))
        let navItem = UINavigationItem(title: "Stations list")
        let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel,
                                   target: nil,
                                   action: #selector(openStationList))
        navItem.leftBarButtonItem = item
        navBar.setItems([navItem], animated: false)
        
        self.view.addSubview(navBar)
    }
    
    @objc func openStationList() {
        
    }
    
    private func bindViewModel() {
        viewModel.stationListCells.bind() { [weak self] _ in
            self?.tableView?.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate
extension StationListViewController {
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.stationListCells.value.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StationListCell") as? StationListCell else {
            return UITableViewCell()
        }
            
        cell.viewModel = viewModel.stationListCells.value[indexPath.row] 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.openStation((indexPath as NSIndexPath).row)
    }
}
