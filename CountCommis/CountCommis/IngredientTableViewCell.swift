//
//  IngredientTableViewCell.swift
//  CountCommis
//
//  Created by Michelline Tran on 3/4/17.
//  Copyright © 2017 Michelline Tran. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
