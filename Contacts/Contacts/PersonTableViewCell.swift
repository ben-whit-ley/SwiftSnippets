//
//  PersonTableViewCell.swift
//  Contacts
//
//  Created by Ben Whitley on 6/19/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    // MARK: - View Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        layoutIfNeeded()
        icon.layer.cornerRadius = icon.frame.size.width / 2
        icon.layer.masksToBounds = true
    }
}
