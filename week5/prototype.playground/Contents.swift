import Foundation

public struct Contact {
    public var firstName: String
    public var lastName: String
}

var contactPrototype = Contact(firstName: "Dom", lastName: "Lynn")

var contactCopy = contactPrototype

print(MemoryUtil.address(&contactPrototype.firstName))
print(MemoryUtil.address(&contactCopy.firstName))

print(contactCopy.firstName)
print(contactPrototype.firstName)


extension Contact: Equatable {
    public static func == (rhs: Contact, lhs: Contact) -> Bool {
        if(rhs.firstName == lhs.firstName && rhs.lastName == lhs.lastName) {
            return true
        }
        return false
    }
}



// copy on write example
var nums: Array<Int> = [1,2,3,4,5]
var numsCopy = nums

print(MemoryUtil.address(&nums))
print(MemoryUtil.address(&numsCopy))

numsCopy.append(6)

print(MemoryUtil.address(&numsCopy))




