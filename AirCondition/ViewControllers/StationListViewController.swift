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
    
    let viewModel: StationListViewModel = StationListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.onLoad()
    }
    
    private func bindViewModel() {
        viewModel.stationListCells.bindAndFire() { [weak self] _ in
            self?.tableView?.reloadData()
        }
    }
    
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

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
}
