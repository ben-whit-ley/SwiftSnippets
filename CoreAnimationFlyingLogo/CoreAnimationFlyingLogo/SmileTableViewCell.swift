//
//  SmileTableViewCell.swift
//  CoreAnimationFlyingLogo
//
//  Created by Ben Whitley on 7/9/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class SmileTableViewCell: UITableViewCell {

// MARK: - IBOutlets

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!

// MARK: - Cell Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
