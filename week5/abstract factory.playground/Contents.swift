//: Playground - noun: a place where people can play

import UIKit

// MARK: - Finish (factory pattern)
// abstract product
public protocol Finish: CustomStringConvertible {
    var color: UIColor {get}
    var price: Float {get}
    var description: String {get}
}
// concrete product
public struct WhiteFinish: Finish {
    public var color = UIColor.white
    public var price = Float(300)
    public var description: String = "\n\tFinish: White"
}
// concrete product
public struct BlackFinish: Finish {
    public var color = UIColor.black
    public var price = Float(350)
    public var description: String = "\n\tFinish: Black"
}


// MARK: - Storage (builder pattern)
// product
public enum StorageType: String, CustomStringConvertible {
    case ssd = "ssd"
    case hdd = "hdd"
    public var description: String {
        return self.rawValue
    }
}
// product
public enum StorageSize: String, CustomStringConvertible {
    case small = "256GB"
    case large = "1TB"
    public var description: String {
        return self.rawValue
    }
}

// builder
public protocol Storage: CustomStringConvertible {
    var type: StorageType {get}
    var size: StorageSize {get}
    var price: Float {get}
}









// concrete product
public struct SmallFlash: Storage {
    public var type = StorageType.ssd
    public var size = StorageSize.small
    public var price = Float(500)
    
    public var description: String {
        return "\n\tStorage: \(size.rawValue) \(type.rawValue)"
    }
    
    public init(){}
}
// concrete product
public struct MediumFlash: Storage {
    public var type = StorageType.ssd
    public var size = StorageSize.large
    public var price = Float(700)
    
    public var description: String {
        return "\n\tStorage: \(size.rawValue) \(type.rawValue)"
    }
    
    public init(){}
}



// MARK: - CPU (builder pattern)
public enum CPUType: String {
    case dualCore = "dual core"
    case quadCore = "quad core"
}

public enum CPUFreq: String {
    case slow = "1.6GHz"
    case fast = "2.6GHz"
}

public protocol CPU: CustomStringConvertible {
    var type: CPUType {get}
    var freq: CPUFreq {get}
    var price: Float {get}
}


public struct NormalCPU: CPU {
    public var type = CPUType.dualCore
    public var freq = CPUFreq.slow
    public var price = Float(300)
    
    public var description: String {
        return "\n\tCPU: \(type.rawValue) \(freq.rawValue)"
    }
}

public struct CrazyCPU: CPU {
    public var type = CPUType.quadCore
    public var freq = CPUFreq.fast
    public var price = Float(500)
    
    public var description: String {
        return "\n\tCPU: \(type.rawValue) \(freq.rawValue)"
    }
}





// MARK: - RAM (builder pattern)
public protocol RAM: CustomStringConvertible {
    var size: RAMSize {get}
    var freq: RAMFreq {get}
    var price: Float {get}
}

public enum RAMSize: String {
    case basic = "8GB"
    case pro = "32GB"
}

public enum RAMFreq: String {
    case slow = "1600MHz"
    case fast = "2400MHz"
}

public struct BasicRAM: RAM {
    public var size = RAMSize.basic
    public var freq = RAMFreq.slow
    public var price = Float(150)
    
    public var description: String {
        return "\n\tRAM: \(size.rawValue) at \(freq.rawValue)"
    }
}

public struct ProRAM: RAM {
    public var size = RAMSize.pro
    public var freq = RAMFreq.fast
    public var price = Float(300)
    
    public var description: String {
        return "\n\tRAM: \(size.rawValue) at \(freq.rawValue)"
    }
}




// MARK: - Computer (non abstract factory)
struct Computer: CustomStringConvertible {
    public var finish: Finish
    public var storage: Storage
    public var cpu: CPU
    public var ram: RAM
    
    public var price: Float {
        get {
            return finish.price + storage.price + cpu.price + ram.price
        }
    }
    
    public var description: String {
        return "\nYour computer: \(finish) \(storage) \(cpu) \(ram)\nPrice: $\(price)"
    }
}

let computer1 = Computer(finish: WhiteFinish(), storage: SmallFlash(), cpu: NormalCPU(), ram: BasicRAM())
let computer2 = Computer(finish: BlackFinish(), storage: MediumFlash(), cpu: CrazyCPU(), ram: ProRAM())


print(computer1)
print(computer2)







//////////////////////////

// MARK: - abstract factory for computer

public enum ComputerType {
    case basic
    case extreme
}


// abstract factory
public class ComputerFactory {
    public func makeFinish() -> Finish? { return nil }
    
    public func makeStorage() -> Storage? { return nil }
    
    public func makeCpu() -> CPU? { return nil }
    
    public func makeRam() -> RAM? { return nil }
    
    public final class func makeFactory(type: ComputerType) -> ComputerFactory {
        var factory: ComputerFactory
        
        switch(type) {
        case .basic: factory = BasicComputerFactory()
        case .extreme: factory = ExtremeComputerFactory()
        }
        
        return factory
    }
}


// concrete factories
class BasicComputerFactory: ComputerFactory {
    override func makeFinish() -> Finish? {
        return WhiteFinish()
    }
    
    override func makeStorage() -> Storage? {
        return SmallFlash()
    }
    
    override func makeCpu() -> CPU? {
        return NormalCPU()
    }
    
    override func makeRam() -> RAM? {
        return BasicRAM()
    }
}

class ExtremeComputerFactory: ComputerFactory {
    override func makeFinish() -> Finish? {
        return BlackFinish()
    }
    
    override func makeStorage() -> Storage? {
        return MediumFlash()
    }
    
    override func makeCpu() -> CPU? {
        return CrazyCPU()
    }
    
    override func makeRam() -> RAM? {
        return ProRAM()
    }
}


let basicComputerFactory = ComputerFactory.makeFactory(type: .basic)
let extremeComputerFactory = ComputerFactory.makeFactory(type: .extreme)

if let finish = basicComputerFactory.makeFinish(),
let storage = basicComputerFactory.makeStorage(),
let cpu = basicComputerFactory.makeCpu(),
let memory = basicComputerFactory.makeRam() {
    // concrete product
    let concreteProduct = Computer(finish: finish, storage: storage, cpu: cpu, ram: memory)
    print(concreteProduct)
}



