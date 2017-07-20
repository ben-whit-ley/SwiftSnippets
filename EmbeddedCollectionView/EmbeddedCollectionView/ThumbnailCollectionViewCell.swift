//
//  ThumbnailCollectionViewCell.swift
//  EmbeddedCollectionView
//
//  Created by Ben Whitley on 7/19/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ThumbnailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var thumbnailImageView: UIImageView!

    // MARK: - Cell Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        thumbnailImageView.layer.cornerRadius = 10.0
        thumbnailImageView.layer.masksToBounds = true
    }
}
