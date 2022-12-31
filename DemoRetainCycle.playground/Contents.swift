import UIKit



// demo release instance
class User{
    var age = 1
    init(age: Int){
        self.age = age
    }
    deinit {
        print("user has age: \(age) was deallocated")
    }
}
var user1: User?
user1 = User(age: 21)
user1?.age = 22
var user2: User? = User(age: 25)

user2 = user1
//user has age: 25 was deallocated

user1 = nil
user2 = nil
//user has age: 22 was deallocated



//Strong Reference Cycles

class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let name: String
    init(name: String) {
        self.name = name
    }
    var owner: Person?
    deinit { print("Apartment \(name) is being deinitialized") }
}
var person: Person? = Person(name: "Anhnv")
var apartment: Apartment? = Apartment(name: "Novaland")
person?.apartment = apartment
apartment?.owner = person
person = nil
apartment = nil
//nothing happend



class Person2 {
    let name: String
    init(name: String) {
        self.name = name
    }
    weak var apartment: Apartment2?
    deinit { print("\(name) 22222 is being deinitialized") }
}

class Apartment2 {
    let name: String
    init(name: String) {
        self.name = name
    }
    weak var owner: Person2?
    deinit { print("Apartment \(name) 2222222 is being deinitialized") }
}
var person2: Person2? = Person2(name: "Anhnv")
var apartment2: Apartment2? = Apartment2(name: "Novaland")
person2?.apartment = apartment2
apartment2?.owner = person2
person2 = nil
apartment2 = nil
//Apartment Novaland 2222222 is being deinitialized
//user has age: 22 was deallocated

