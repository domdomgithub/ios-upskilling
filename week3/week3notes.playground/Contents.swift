//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



let image = UIImage(named: "thing")
let thingView = UIImageView(image: image)
let imageSize = thingView.bounds.size

let aspectRatio = imageSize.width/imageSize.height

let constraint = NSLayoutConstraint(
    item: thingView,
    attribute: NSLayoutAttribute.height,
    relatedBy: NSLayoutRelation.equal,
    toItem: thingView,
    attribute: NSLayoutAttribute.width,
    multiplier: aspectRatio,
    constant: 1.0
)

thingView.addConstraint(constraint)
