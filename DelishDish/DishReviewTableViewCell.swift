//
//  DishReviewTableViewCell.swift
//  DelishDish
//
//  Created by Winnie Wen on 10/25/16.
//  Copyright © 2016 wiwen. All rights reserved.
//

import UIKit

class DishReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
