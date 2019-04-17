//
//  ImageTableViewCell.swift
//  MenuChallenge
//
//  Created by Daniel Bermudez on 4/17/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCellDescription: UILabel!
    
    
    @IBOutlet weak var imageCellImageView: UIImageView!
    
    @IBOutlet weak var textStackView: UIStackView!
    @IBOutlet weak var imageCellStackView: UIStackView!
    @IBOutlet weak var imageCellTitle: UILabel!
    override func prepareForReuse() {
        super .prepareForReuse()
        self.contentView.layoutIfNeeded()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
