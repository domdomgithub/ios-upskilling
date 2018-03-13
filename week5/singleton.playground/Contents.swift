//: Playground - noun: a place where people can play

//let myClass = SomeClassA()

class SomeClassA {
    
    //    static let myClass = SomeClassA()
    
    private static var myClass: SomeClassA = {
       return SomeClassA()
    }()
    
    
    private init() {
        // ...
    }
    
    class func shared() -> SomeClassA {
        return myClass
    }
    
}


///////////////////////////////////////////////


class SomeClassB {

    
    private var created = false
    
    private static var myClass: SomeClassB = {
        return SomeClassB()
        
        let sc = SomeClassB()
        // ...
        return sc
    }()
    
    
    private init() {
        if created { return }
        created = true;
        // ...
    }
    
    class func shared() -> SomeClassB {
        return myClass
    }
    
}
