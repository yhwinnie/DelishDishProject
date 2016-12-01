//
//  ReviewsViewController.swift
//  DelishDish
//
//  Created by Winnie Wen on 10/25/16.
//  Copyright © 2016 wiwen. All rights reserved.
//

import UIKit


class ReviewsViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var rateView: RateView! = nil // view
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var foodImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewTextView.delegate = self
        // create board view and add it as a subview
        reviewTextView.layer.borderWidth = 1.0
        reviewTextView.setContentOffset(CGPoint.zero, animated: false)
        reviewTextView.layer.borderColor = UIColor.gray.cgColor
        reviewTextView.tintColor = UIColor.darkGray
        
        //let margin = 1
        //let rateWidth = view.bounds.width - CGFloat(2)
        let rateWidth: CGFloat = 200
        let rateView = RateView(rateWidth: rateWidth, rateHeight: 40)
        rateView.center = view.center
        //rateView.frame.origin.y -= 200
        
        view.addSubview(rateView)
        self.rateView = rateView
        //    self.rateView.delegate = self
        
        self.rateView.completionHandler = printPosition
    }
    
    @IBAction func addPictureAction(_ sender: AnyObject) {
        
        let myActionSheet = UIAlertController(title: "Dish Picture", message: "Please take a picture or choose from your photo library.", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cameraButton = UIAlertAction(title: "Take Picture", style: UIAlertActionStyle.default) {
            (ACTION) in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let libraryPressed = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default) {
            (ACTION) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        
        
        
        
        let cancelButtonAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            (ACTION) in
            
        }
        
        myActionSheet.addAction(cameraButton)
        myActionSheet.addAction(libraryPressed)
        myActionSheet.addAction(cancelButtonAction)
        self.present(myActionSheet, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.foodImage.image = image

        dismiss(animated: true, completion: nil)
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
