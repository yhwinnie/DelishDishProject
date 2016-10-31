//
//  ReviewsViewController.swift
//  DelishDish
//
//  Created by Winnie Wen on 10/25/16.
//  Copyright © 2016 wiwen. All rights reserved.
//

import UIKit

class ReviewsViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    weak var rateView: RateView! = nil // view
    @IBOutlet weak var reviewTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewTextView.delegate = self
        // create board view and add it as a subview
        reviewTextView.layer.borderWidth = 1.0
        reviewTextView.setContentOffset(CGPoint.zero, animated: false)

        
        //let margin = 1
        //let rateWidth = view.bounds.width - CGFloat(2)
        let rateWidth: CGFloat = 200
        let rateView = RateView(rateWidth: rateWidth, rateHeight: 40)
        rateView.center = view.center
        rateView.frame.origin.y -= 200
        
        view.addSubview(rateView)
        self.rateView = rateView
        //    self.rateView.delegate = self
        
        self.rateView.completionHandler = printPosition
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printPosition(x: Int) {
        print(x)
    }
    
    func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Tell us about the dish" {
            textView.text = ""
        }
    }

}
