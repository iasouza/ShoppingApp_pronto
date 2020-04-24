//
//  GaleriaTableViewCell.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 24/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit

class GaleriaTableViewCell: UITableViewCell {

    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bandaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
