//
//  FavoritosTableViewCell.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 04/05/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit

class FavoritosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var capa: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var banda: UILabel!
    
    @IBOutlet weak var semFavoritos: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
