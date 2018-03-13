//: Playground - noun: a place where people can play

import UIKit

public class Theme {
    public let bgColor: UIColor
    public let textColor: UIColor
    public let font: UIFont
    
    // telescoping
    
//    public init (bgColor: UIColor, textColor: UIColor, font: UIFont) {
//        self.bgColor = bgColor
//        self.textColor = textColor
//        self.font = font
//    }
//
//    public convenience init(bgColor: UIColor, textColor: UIColor) {
//        self.init(bgColor: bgColor, textColor: textColor, font: UIFont.systemFont(ofSize: 12))
//    }
//
//    public convenience init(bgColor: UIColor) {
//        self.init(bgColor: bgColor, textColor: UIColor.black)
//    }
//
//    public convenience init() {
//        self.init(bgColor: UIColor.white)
//    }
    
    // cleaner
    public init(bgColor: UIColor = UIColor.white, textColor: UIColor = UIColor.black, font: UIFont = UIFont.systemFont(ofSize: 12)) {
        self.bgColor = bgColor
        self.textColor = textColor
        self.font = font
    }
    
}


var defaultTheme = Theme(bgColor: UIColor.white, textColor: UIColor.black, font: UIFont.systemFont(ofSize: 15))
let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 800, height: 44)))
label.backgroundColor = defaultTheme.bgColor
label.textColor = defaultTheme.textColor
label.font = defaultTheme.font
label.text = "White background, black text, system font 15"







public class ThemeBuilder {
    public var bgColor = UIColor.black
    public var textColor = UIColor.white
    public var font = UIFont.systemFont(ofSize: 12)
    
    public init() {}
    
    public var defaultTheme: Theme {
        get {
            return Theme(bgColor: self.bgColor, textColor: self.textColor, font: self.font)
        }
    }
}


let themeBuilder = ThemeBuilder()
defaultTheme = themeBuilder.defaultTheme

label.backgroundColor = defaultTheme.bgColor
label.textColor = defaultTheme.textColor
label.font = defaultTheme.font
label.text = "using theme builder defaults"






