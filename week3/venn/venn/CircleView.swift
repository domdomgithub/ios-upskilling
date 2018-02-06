//
//  CircleView.swift
//  venn
//
//  Created by Dominic Lynn on 23/1/18.
//  Copyright © 2018 Dominic Lynn. All rights reserved.
//

import UIKit


@IBDesignable
class CircleView: UIView {

    @IBInspectable
    var fillColor: UIColor {
        didSet {
            self.layoutSubviews()
            self.layoutIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        self.fillColor = UIColor.lightText
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.fillColor = UIColor.lightText
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    var shapeLayer: CAShapeLayer{
        get{
            return self.layer as! CAShapeLayer
        }
        
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAShapeLayer.self
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bezierPath = UIBezierPath(ovalIn: self.bounds)
        self.shapeLayer.fillColor = self.fillColor.cgColor
        self.shapeLayer.path = bezierPath.cgPath
    }
    
}
