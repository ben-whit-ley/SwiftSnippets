//
//  TimelineTableViewCell.swift
//  SaveDateLocationPhoto
//
//  Created by Ben Whitley on 6/21/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {

// MARK: - IBOutlets

    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var entryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        layoutIfNeeded()
        selectedImageView.layer.cornerRadius = selectedImageView.frame.size.width * 0.1
        selectedImageView.layer.masksToBounds = true
    }

    override func setSelected(
        _ selected: Bool,
        animated: Bool) {

        super.setSelected(selected,
                          animated: animated)

    }
}
