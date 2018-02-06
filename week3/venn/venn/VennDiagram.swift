//
//  VennDiagram.swift
//  venn
//
//  Created by Dominic Lynn on 23/1/18.
//  Copyright © 2018 Dominic Lynn. All rights reserved.
//

import UIKit

enum VennWeight {
    case Left
    case Right
    case Balanced
    
}


class VennDiagram: UIView {
    
    @IBOutlet weak var leftCircleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftCircleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftCircleBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rightCircleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightCircleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightCircleBottomConstraint: NSLayoutConstraint!
    
    var weight: VennWeight = .Balanced {
        didSet {
            self.setNeedsUpdateConstraints()
        }
    }
    
    override func updateConstraints() {
        switch self.weight {
        case .Left:
            self.leftCircleTopConstraint.constant = 20
            self.leftCircleLeadingConstraint.constant = 20
            self.leftCircleBottomConstraint.constant = 20
            
            self.rightCircleTopConstraint.constant = 40
            self.rightCircleLeadingConstraint.constant = 40
            self.rightCircleBottomConstraint.constant = 40
        case .Right:
            self.leftCircleTopConstraint.constant = 40
            self.leftCircleLeadingConstraint.constant = 40
            self.leftCircleBottomConstraint.constant = 40
            
            self.rightCircleTopConstraint.constant = 20
            self.rightCircleLeadingConstraint.constant = 20
            self.rightCircleBottomConstraint.constant = 20
        case .Balanced:
            self.leftCircleTopConstraint.constant = 20
            self.leftCircleLeadingConstraint.constant = 20
            self.leftCircleBottomConstraint.constant = 20
            
            self.rightCircleTopConstraint.constant = 20
            self.rightCircleLeadingConstraint.constant = 20
            self.rightCircleBottomConstraint.constant = 20
        }
        
        super.updateConstraints()
            
    }
    
}
