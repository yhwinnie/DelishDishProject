//
//  RateView.swift
//  StarRating
//
//  Created by Kojin on 10/12/16.
//  Copyright © 2016 Kojin. All rights reserved.
//

import UIKit

fileprivate let numberOfStars: CGFloat = 5

protocol RateViewDelegate {
    func printPosition (x: Int)
}

class RateView: UIView {
    
    var delegate: RateViewDelegate?
    var starWidth: CGFloat
    convenience init(rateWidth: CGFloat, rateHeight: CGFloat) {
        let starWidth = rateWidth / numberOfStars
        self.init(starWidth: starWidth, rateHeight: rateHeight)
    }
    var stars = [StarView]()
    var completionHandler: ((Int)->Void)?
    
    init(starWidth: CGFloat, rateHeight: CGFloat) {
        // initialise the view
        let boardFrame = CGRect(x: 0, y: 0, width: numberOfStars*starWidth, height: rateHeight)
        self.starWidth = starWidth
        super.init(frame: boardFrame)
        
        // add the fields
        for i in 0..<Int(numberOfStars) {
            
            // calculate x position for the current field
            let xPosition = i
            let x = CGFloat(xPosition) * starWidth
            let currentStarFrame = CGRect(x: x, y: 0, width: starWidth, height: rateHeight)
            let star = StarView(frame: currentStarFrame, xPosition: xPosition, starWidth: starWidth, rateHeight: rateHeight)
            //star.layer.borderWidth = 1.0
            
            
            // add a gesture recognizer to the field
            let tap = UITapGestureRecognizer(target: self, action: #selector(RateView.handleTap(_:)))
            star.addGestureRecognizer(tap)
            
            
            // add the field as subview to our board
            self.addSubview(star)
            self.stars.append(star)
        }
        
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchedField = touch.view as! StarView
            if touch.location(in: self).x < 0 {
                var i = 0
                while (i < stars.count) {
                    stars[i].text = touchedField.emptyStar
                    i += 1
                }
            } else {
                let starIndex = Int(touch.location(in: self).x) / Int(self.starWidth)
                completionHandler!(starIndex)
                if (starIndex < stars.count) {
                    
                    for i in 0...starIndex {
                        stars[i].text = touchedField.blackStar
                    }
                    var i = starIndex+1
                    while (i < stars.count) {
                        stars[i].text = touchedField.emptyStar
                        i += 1
                    }
                }
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleTap(_ tap: UITapGestureRecognizer) {
        let tappedField = tap.view as! StarView
        if tappedField.text == tappedField.blackStar {
            for i in tappedField.xPosition...Int(numberOfStars)-1 {
                stars[i].text = tappedField.emptyStar
            }
        } else {
            for i in 0...tappedField.xPosition {
                stars[i].text = tappedField.blackStar
            }
        }
        
        
    }
    
}


