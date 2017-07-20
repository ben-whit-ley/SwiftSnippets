//
//  ChartsTableViewController.swift
//  SegmentedControl
//
//  Created by Ben Whitley on 7/5/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

let myGreen = UIColor(red: 0.0/255.0,
                      green: 255.0/255.0,
                      blue: 86.0/255.0,
                      alpha: 1.0)

class ChartsTableViewController: UIViewController {

// MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ChartsTableViewController: UITableViewDataSource {

    func numberOfSections
        (in tableView: UITableView) -> Int {

        return 1
    }

    func tableView
        (_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {

        return dataModel.charts.count
    }

    func tableView
        (_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "chartCell",
                                                 for: indexPath)


        if let chartCell = cell as? ChartTableViewCell {

            let chartItem = dataModel.charts[indexPath.row]

            if let imageName = chartItem["image"] {
                chartCell.icon?.image = UIImage(named: imageName)
            }

            chartCell.numberLabel.text = "\(indexPath.row + 1)"
            chartCell.titleLabel.text = chartItem["title"]
            chartCell.descriptionLabel.text = chartItem["description"]
            chartCell.ratingsLabel.text = chartItem["ratings"]

            return chartCell
        }

        return cell
    }
}
