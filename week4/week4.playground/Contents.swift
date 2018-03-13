//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 
 MARK: - (similar to pragma)
 FIXME:
 TODO:
 possible to add build phase script to show them as warnings
 
 more comment types
 http://nshipster.com/swift-documentation/
 
 
 NSException -> compile errors (cannot be caught in swift)
 NSError -> runtime error
 
 
 NSRangeException
 NSInvalidArgumentException
 
 NSInternalInconsistencyException
 failed assertions
 
 NSObjectInaccessibleException
 accessing objects (w/o permission) on other thread
 
 NSObjectNotAvailableException
 connectivity issue
 
 NSDestinationInvalidException
 unexcepted condition? killed thread?
 
 NSUnknownKeyException
 invalid key
 
 NSPortTimeoutException
 port timeout
 
 NSInvalidSendPortException
 NSInvalidReceivePortException
 NSConnection has become invalid
 
 NSPortSendException
 NSPortReceiveException
 generic errors
 
 NSGenericException
 lol everything else
 
 
 SIGNALS
 SIGABRT (exe crash)
 abnormal termination
 logically incorrect code?
 
 SIGSEGV - exists, no access
 SIGBUS - does not exist
 EXC_BAD_ACCESS
 invalid memory access
 
 SIGFPE
 floating point exception
 
 SIGILL
 invalid instruction
 
 SIGINT
 interactive attention request
 
 SIGTERM
 termination request
 
 SIGTRAP
 trap instruction, try/catch
 
 
 
 */

enum CustomError: Error {
    case Empty
    case TooShort(Int)
}

func mangleName (name: String) throws -> String {
    guard name.count > 0 else { throw CustomError.Empty }
    guard name.count >= 2 else {
        throw CustomError.TooShort(name.count)
    }
    
    return String(name.reversed())
}


do {
    try mangleName(name: "")
    // ...
    // ...
} catch CustomError.Empty {
    
} catch CustomError.TooShort( _) {
    
}



// return nil if error
let a = try? mangleName(name: "")


func aaaa() {
    // DODGY
    // ignore error propagation
    let _ = try! mangleName(name: "")
}














