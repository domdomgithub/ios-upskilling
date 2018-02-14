//
//  VennDiagram.swift
//  venn
//
//  Created by Dominic Lynn on 23/1/18.
//  Copyright © 2018 Dominic Lynn. All rights reserved.
//

import UIKit

enum VennWeight {
    case left
    case right
    case balanced
    
}


class VennDiagram: UIView {
    
    @IBOutlet weak var leftCircleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftCircleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftCircleBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rightCircleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightCircleTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightCircleBottomConstraint: NSLayoutConstraint!
    
    var weight: VennWeight = .balanced {
        didSet {
            self.setNeedsUpdateConstraints()
        }
    }
    
//    override func awakeFromNib() {
//        let view = UIView()
//        view.frame = self.bounds
//        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
//        view.layer.cornerRadius = 12.0
//        view.autoresizingMask = [
//            UIViewAutoresizing.flexibleWidth,
//            UIViewAutoresizing.flexibleHeight
//        ]
//
//        //        view.translatesAutoresizingMaskIntoConstraints = true
//
//        self.insertSubview(view, at: 0)
//    }
    
    override func updateConstraints() {
        switch self.weight {
        case .left:
            print("left")
            self.leftCircleTopConstraint.constant = 20
            self.leftCircleLeadingConstraint.constant = 20
            self.leftCircleBottomConstraint.constant = 20

            self.rightCircleTopConstraint.constant = 40
            self.rightCircleTrailingConstraint.constant = 40
            self.rightCircleBottomConstraint.constant = 40
        case .right:
            print("right")
            self.leftCircleTopConstraint.constant = 40
            self.leftCircleLeadingConstraint.constant = 40
            self.leftCircleBottomConstraint.constant = 40

            self.rightCircleTopConstraint.constant = 20
            self.rightCircleTrailingConstraint.constant = 20
            self.rightCircleBottomConstraint.constant = 20
        case .balanced:
            print("balanced")
            self.leftCircleTopConstraint.constant = 20
            self.leftCircleLeadingConstraint.constant = 20
            self.leftCircleBottomConstraint.constant = 20

            self.rightCircleTopConstraint.constant = 20
            self.rightCircleTrailingConstraint.constant = 20
            self.rightCircleBottomConstraint.constant = 20
        }
        
        super.updateConstraints()
            
    }
    
}
