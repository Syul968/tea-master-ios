//
//  TeaTableViewCell.swift
//  Tea Master
//
//  Created by Luis Flores on 4/10/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit

class TeaTableViewCell: UITableViewCell {
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rating: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
