//var a: Int?
//var b: Int?
//
//a = 1
//b = 2
//
////var c = "asdf"
////switch c {
////    case "asdf": fallthrough
////    case "fda":
////        print ("hi")
////    default:
////        print ("default")
////}
//
//
//
//if let c = a, let d = b {
//    print("hi")
//}
//
//for i in 0...10 {
//    print(i)
//}
//
//var things = ["thing1", "thing2", "thing3", "thing4"]
//for i in 0..<things.count {
//    print(things[i])
//}
//
//func removeHtml(htmlString: String) {
//}
//removeHtml(htmlString: "sdfsdf")
//
//func someSong() -> (songName: String, albumName: String, artistName: String, duration: Int) {
//    return ("Deception Bay", "DB EP", "Boo Seeka", 345)
//}
//
//_ = someSong()
//let _ = someSong()
//
//
//func printDuration(_ duration: Int) -> String {
//    return "\(duration / 60)m:\(duration % 60)s"
//}
//
//let song = someSong()
//print("Listening to \(song.songName) from \(song.albumName) by \(song.artistName). Duration: \(printDuration(song.duration))")
//
//func someFunc() -> Void {
//    // code
//}
//
//
//let someText = { print("this is a closure") }
//someText()
//
//let divide = {
//    (val1: Int, val2: Int) -> Int in
//    return val1 / val2
//}
//
//let result = divide(200, 20)
//print (result)
//
//
//
//
//protocol myProtocol {
//    var valA: Int { get set }
//    var valB: Int { get set }
//
//    func add() -> Int
//}
//
//
////class myClass: myProtocol {
////    var valA: Int = 4
////    var valB: Int = 5
////
////    func add() -> Int {
////        return(valA + valB)
////    }
////
////    print( "\( add())" )
////}
//
//
//
//enum stuff : Int {
//    case stuff1 = 1
//    case stuff2 = 2
//    case stuff3 = 3
//}
//
//stuff.stuff1
//
//
//
//
//class Song {
//    var name: String = ""
//    var duration: Int {
//        get {
//            return self.duration
//        }
//        set {
//            self.duration = newValue
//        }
//    }
//
//    init (_ name: String, duration: Int) {
//        self.name = name
//        self.duration = duration
//    }
//}
//
////var mySong = Song("asdf", duration: 123)
//
//
//
//
//
//func domp() -> Int{
//    print("domp()")
//    return 123
//}
//
//func any() -> Int {
//
//
//    let a = "aaaaa"
//
//    if a == "aaaaa" {
//        defer {
//            print("\(a)")
//        }
//    } else {
//        defer {
//            print ("bbb")
//        }
//    }
//
//    //
//    //
//    //
//
//
//    return domp()
//}
//
//// ???
//
//any()
//
//
//
//protocol DomProtocol {
//    var a: Int { get set }
//
//    func addOneToA() -> Int
//}
//
//protocol DomProtocolB {
//    func some()
//}
//
//class DomClass: ExtendMe {
//    var a: Int = 0
//}
//
//extension DomClass: DomProtocol {
////    var a: Int = 0
//
//    func addOneToA() -> Int {
//        return a+1
//    }
//}
//
//extension DomClass: DomProtocolB {
//    func some() {
//    }
//}
//
//class ExtendMe {
//    func printB() {
//        print("BB")
//    }
//}
//
//
//var domProt: DomClass = DomClass()
//domProt.a = 123
//
//type(of: domProt)
//
//import UIKit
////var afrColors: UIColor = UIColor()
//
//extension UIColor {
//    static func afrBlue() {
//        print( "#123456")
//    }
//}
//
//UIColor.afrBlue()
//
//
//class myUIColor: UIColor {
//    static func a() {
//
//    }
//}
//

class DomTime {
    
    var sec: Double = 100
    
    fileprivate(set) var min: Double {
        get {
            return sec / 60
        }
        set (newVal){
            self.sec = newVal * 60
        }
    }
    
    var hour:Double = 23
    
}


var dt = DomTime()
print(dt.min)
dt.min = 200
print(dt.min)

dt.hour = 1



enum DomErrors: Error {
    case thingIsEmpty
    case parseToIntFailed(attemptedValue:String)
}


class Person {

    var name:String?

    init(name:String?) throws {
        guard let name = name else {
            throw DomErrors.thingIsEmpty
        }
        self.name = name
    }

}


do {
    let dom = try Person(name:nil)
} catch DomErrors.thingIsEmpty {
    print("thing is empty")
}

let faiq = try? Person(name: "Faiq")
let adam = try? Person(name: nil)
// let adam = try! Person(name: nil)
print(faiq?.name)
print(adam?.name)










