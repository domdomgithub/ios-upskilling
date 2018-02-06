
import UIKit

public protocol ColorPalette {
    var bgColor: UIColor {get}
    var textColor: UIColor {get}
}


struct WhiteboardPalette: ColorPalette {
    public var bgColor: UIColor {
        get {
            return UIColor.white
        }
    }
    
    public var textColor: UIColor {
        get {
            return UIColor.black
        }
    }
}

struct BlackboardPalette: ColorPalette {
    public var bgColor: UIColor {
        get {
            return UIColor.black
        }
    }
    
    public var textColor: UIColor {
        get {
            return UIColor.white
        }
    }
}

let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 800, height: 44)))

let whiteboard = WhiteboardPalette()
label.backgroundColor = whiteboard.bgColor
label.textColor = whiteboard.textColor
label.text = "whiteboard"



let blackboard = BlackboardPalette()
label.backgroundColor = blackboard.bgColor
label.textColor = blackboard.textColor
label.text = "blackboard"



public enum ColorTheme {
    case whiteboard
    case blackboard
}

public class PaletteFactory {
    public class func makePalette(theme: ColorTheme) -> ColorPalette {
        switch(theme) {
        case .whiteboard:
            return WhiteboardPalette()
        case .blackboard:
            return BlackboardPalette()
        }
    }
}



let factoryWhiteboard = PaletteFactory.makePalette(theme: .whiteboard)














