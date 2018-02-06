//
//  ProfileView.swift
//  Collaborate
//
//  Created by Dominic Lynn on 30/1/18.
//  Copyright © 2018 Dominic Lynn. All rights reserved.
//

import UIKit


@IBDesignable
class ProfileView: UIView {
    
    var profileImageView: UIImageView!
    var networkImageView: UIImageView!
    
    @IBInspectable var profileImage: UIImage? {
        didSet {
            profileImageView.image = profileImage
        }
    }
    
    @IBInspectable var networkImage: UIImage? {
        didSet {
            networkImageView.image = networkImage
        }
    }
    
    var profileTopConstraint: NSLayoutConstraint!
    
    var networkLeadingConstraint: NSLayoutConstraint!
    var networkBottomConstraint: NSLayoutConstraint!
    var networkTrailingConstraint: NSLayoutConstraint!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initializeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeViews()
    }
    
    
    
    override open class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    
    private func initializeViews() {
        self.backgroundColor = UIColor.lightGray
        self.profileImageView = UIImageView(frame: CGRect.zero)
        self.profileImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.profileImageView)
        
        
//        self.profileTopConstraint = NSLayoutConstraint(
//            item: self.profileImageView,
//            attribute: .top,
//            relatedBy: .equal,
//            toItem: self,
//            attribute: .top,
//            multiplier: 1,
//            constant: 0
//        )
        // or...
        self.profileTopConstraint = self.profileImageView.topAnchor.constraint(equalTo: self.topAnchor)
        self.profileTopConstraint.isActive = true
        
//        let profileLeading = NSLayoutConstraint(
//            item: self.profileImageView,
//            attribute: .leading,
//            relatedBy: .equal,
//            toItem: self,
//            attribute: .leading,
//            multiplier: 1,
//            constant: 0
//        )
        self.profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        
//        self.addConstraints([self.profileTopConstraint, profileLeading])
        
        self.networkImageView = UIImageView(frame: CGRect.zero)
        self.networkImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.networkImageView)
        
//        let networkTop = NSLayoutConstraint(
//            item: self.networkImageView,
//            attribute: .top,
//            relatedBy: .equal,
//            toItem: self,
//            attribute: .top,
//            multiplier: 1,
//            constant: 0
//        )
        self.networkImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
//        self.networkTrailingConstraint = NSLayoutConstraint(
//            item: self.networkImageView,
//            attribute: .trailing,
//            relatedBy: .equal,
//            toItem: self.profileImageView,
//            attribute: .trailing,
//            multiplier: 1,
//            constant: 0
//        )
        self.networkTrailingConstraint = self.networkImageView.trailingAnchor.constraint(equalTo: self.profileImageView.trailingAnchor)
        self.networkTrailingConstraint.isActive = true
        
//        self.networkBottomConstraint = NSLayoutConstraint(
//            item: self.networkImageView,
//            attribute: .bottom,
//            relatedBy: .equal,
//            toItem: self,
//            attribute: .top,
//            multiplier: 1,
//            constant: 0
//        )
        self.networkBottomConstraint = self.networkImageView.bottomAnchor.constraint(equalTo: self.topAnchor)
        self.networkBottomConstraint.isActive = true
        
//        self.networkLeadingConstraint = NSLayoutConstraint(
//            item: self.networkImageView,
//            attribute: .leading,
//            relatedBy: .equal,
//            toItem: self,
//            attribute: .leading,
//            multiplier: 1,
//            constant: 0
//        )
        self.networkLeadingConstraint = self.networkImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        self.networkLeadingConstraint.isActive = true
        
//        self.addConstraints([networkTop, self.networkBottomConstraint, self.networkLeadingConstraint, self.networkTrailingConstraint])
    }
    
    
    
    override func updateConstraints() {
        if let pImage = self.profileImage, let nImage = self.networkImage {
            let leadingDistance = pImage.size.width * 0.65
            self.networkLeadingConstraint.constant = leadingDistance
            self.networkBottomConstraint.constant = pImage.size.height * 0.35
            
            self.profileTopConstraint.constant = nImage.size.height * 0.25
            
            let maxDistance = (leadingDistance + nImage.size.width) - pImage.size.width
            
            self.networkTrailingConstraint.constant = maxDistance
        }
        
        super.updateConstraints()
    }
    
    
    
    override open var intrinsicContentSize: CGSize {
        if let pImage = self.profileImage {
            return pImage.size
        } else {
            return CGSize(width: UIViewNoIntrinsicMetric, height: UIViewNoIntrinsicMetric)
        }
    }
    
    
    
//    override func alignmentRect(forFrame frame: CGRect) -> CGRect {
//        let maxX = self.networkTrailingConstraint.constant > 0 ? self.networkTrailingConstraint.constant : 0
//
//        return CGRect(x: 0, y: 0, width: self.profileTopConstraint.constant, height: maxX)
//    }
    
    
    override var alignmentRectInsets: UIEdgeInsets {
        let maxX = self.networkTrailingConstraint.constant > 0 ? self.networkTrailingConstraint.constant : 0

        return UIEdgeInsets(top: 0, left: 0, bottom: self.profileTopConstraint.constant, right: maxX)
    }
    
    
    
    
    
    override func alignmentRect(forFrame frame: CGRect) -> CGRect {
        return CGRect(
            x:0,
            y:0,
            width: self.bounds.width+10,
            height: self.bounds.height+5
        )
    }
    
    override func frame(forAlignmentRect alignmentRect: CGRect) -> CGRect {
        return CGRect(
            x:0,
            y:0,
            width: self.bounds.width-10,
            height: self.bounds.height-5
        )
    }
    

}
