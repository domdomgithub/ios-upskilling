//
//  LaunchViewController.swift
//  Collaborate
//
//  Created by Dominic Lynn on 8/1/18.
//  Copyright © 2018 Dominic Lynn. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let logo = UIImageView(image: UIImage(named: "Logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false  // ??
        self.view.addSubview(logo)
        
        
        let centerX = NSLayoutConstraint(
            item: logo,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )
        
        let centerY = NSLayoutConstraint(
            item: logo,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        )
        
        let imageSize = logo.image!.size
        let aspectRatio = NSLayoutConstraint(
            item: logo,
            attribute: .width,
            relatedBy: .equal,
            toItem: logo,
            attribute: .height,
            multiplier: imageSize.width / imageSize.height,
            constant: 1
        )
        
        let top = NSLayoutConstraint(
            item: logo,
            attribute: .top,
            relatedBy: .greaterThanOrEqual,
            toItem: self.view,
            attribute: .topMargin,
            multiplier: 1,
            constant: 20
        )
        
        let leading = NSLayoutConstraint(
            item: logo,
            attribute: .leading,
            relatedBy: .greaterThanOrEqual,
            toItem: self.view,
            attribute: .leadingMargin,
            multiplier: 1,
            constant: 20
        )
        
        logo.addConstraint(aspectRatio)
        self.view.addConstraints([centerX, centerY, top, leading])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
