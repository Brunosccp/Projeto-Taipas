//
//  FavTableViewCell.swift
//  Projeto Taipas
//
//  Created by Stefan V. de Moraes on 24/08/2018.
//  Copyright © 2018 Bruno Rocca. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var musicLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
