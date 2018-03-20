//
//  CustomCell.swift
//  week2
//
//  Created by Dominic Lynn on 21/12/17.
//  Copyright © 2017 Dominic Lynn. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var recipe:RecipeModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        recipe = nil
    }
}
