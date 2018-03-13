
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










///////////////////////////////////










// factory base
public enum ColorTheme {
    case whiteboard
    case blackboard
}

// concrete factory
public class PaletteFactory {
    public class func makePalette(theme: ColorTheme) -> ColorPalette {
        switch(theme) {
        case .whiteboard:
            return WhiteboardPalette()
        case .blackboard:
            return BlackboardPalette()
        }
        // case ...
    }
}







// client
let product = PaletteFactory.makePalette(theme: .whiteboard)
//let product = PaletteFactory.makePalette(theme: .blackboard)
label.backgroundColor = product.bgColor
label.textColor = product.textColor
label.text = "factory board"











