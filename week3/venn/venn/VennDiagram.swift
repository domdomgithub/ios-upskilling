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
    
/*
     rendering pipeline:
 updateContraints() -> layoutSubviews() (top down) -> drawRect() (custom rendering)
     
     setNeedsUpdateConstraints()
     updateConstraintsIfNeeded()
     
     setNeedsLayout() <- will call update constraints i needed
     layoutIfNeeded()
     
 */
    
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
