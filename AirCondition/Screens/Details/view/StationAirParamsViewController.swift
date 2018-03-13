//
//  StationAirParamsViewController.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 02.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit

class StationAirParamsViewController: UITableViewController {
    
    let viewModel: StationAirParamsViewModel = StationAirParamsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.onLoad()
    }
    
    private func bindViewModel() {
        viewModel.stationAirParamsListCells.bindAndFire() { [weak self] _ in
            self?.tableView?.reloadData()
        }
    }
    
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

// MARK: - UITableViewDelegate
extension StationAirParamsViewController {
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.stationAirParamsListCells.value.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StationAirParamsCell") as? StationAirParamsCell else {
            return UITableViewCell()
        }
        
     //   cell.viewModel = viewModel.stationAirParamsListCells.value[indexPath.row] as! StationAirParamsCellViewModel
        return cell
    }
}
