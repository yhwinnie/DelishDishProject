//
//  StarView.swift
//  StarRating
//
//  Created by Kojin on 10/12/16.
//  Copyright © 2016 Kojin. All rights reserved.
//

import UIKit

class StarView: UILabel {

  let xPosition: Int // range: [0, 1, 2, 3, 4, 5]
  let blackStar = "\u{2605}"
  let emptyStar = "\u{2606}"

  
  init(frame: CGRect, xPosition: Int, starWidth: CGFloat, rateHeight: CGFloat) {
      assert(xPosition >= 0 && xPosition <= 5, "value '\(xPosition)' is not allowed for x position of field")
    self.xPosition = xPosition
    super.init(frame: frame)
    self.text = emptyStar
    self.textAlignment = .center;
    self.isUserInteractionEnabled = true
    self.font = self.font.withSize(30)
    self.textColor = UIColor.yellow

  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
