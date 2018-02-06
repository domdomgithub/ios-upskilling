//
//  AddViewController.swift
//  week2
//
//  Created by Dominic Lynn on 20/12/17.
//  Copyright © 2017 Dominic Lynn. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var titleText: UITextField!
    @IBOutlet var recipeContent: UITextView!
    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var addButon: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        recipeContent.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        //NSNotification.addObserver(self, forKeyPath: "textTitleDidChange", options: NSNotification.Type.didChange(self), context: nil)
        //NSNotification.addObserver(self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textTitleDidChange() {
        handleButtonStates()
    }
    
    func recipeContentDidChange() {
        handleButtonStates()
    }

    @IBAction func buttonDone_click(_ sender: Any) {
        recipeContent.resignFirstResponder()
    }
    
    
    @IBAction func titleButtonDone(_ sender: Any) {
        titleText.resignFirstResponder()
    }
    
    func handleButtonStates() {
        doneButton.isEnabled = false
        addButon.isEnabled = false
        addButon.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        
        if(recipeContent.text != "") {
            doneButton.isEnabled = true
            
            if(titleText.text != "") {
                addButon.isEnabled = true
                addButon.setTitleColor(UIColor.white, for: UIControlState.normal)
            }
        }
    }
    
    @IBAction func addButton_click(_ sender: Any) {
        activityIndicator.startAnimating()
        
        RecipeManager.addRecipe(title: titleText.text!, content: recipeContent.text!)
        titleText.text = ""
        recipeContent.text = ""
        
        activityIndicator.stopAnimating()
        
        NSUserDefaultsManager.synchronize()
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
