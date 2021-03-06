//
//  CommentWritingViewController.swift
//  HBPart
//
//  Created by 한효병 on 27/01/2018.
//  Copyright © 2018 한효병. All rights reserved.
//

import UIKit

class CommentWritingViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var commentTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        placeholderLabel.text = "내용"
        
        commentTextView!.layer.borderWidth = 1
        commentTextView!.layer.borderColor = UIColor.lightGray.cgColor
        commentTextView.delegate = self
        commentTextView.textContainer.maximumNumberOfLines = 3
        
        
    }
    
    @IBAction func exitButtonClicked(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        navigationController?.popViewController(animated: false)
    }
    
    

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let str = textView.text else { return true }
        let newLength = str.count + text.count - range.length
        return newLength <= 50
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        CommentPhotoViewController.comment.comment = commentTextView.text
        CommentPhotoViewController.comment.title = "default"
//        CommentPhotoViewController.comment.password = passwordTextField.text
        CommentPhotoViewController.comment.password = "default"
    }
 

}
