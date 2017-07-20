//
//  ChartTableViewCell.swift
//  SegmentedControl
//
//  Created by Ben Whitley on 7/5/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ChartTableViewCell: UITableViewCell {

// MARK: - IBOutlets

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
