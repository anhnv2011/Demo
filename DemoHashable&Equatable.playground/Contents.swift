import UIKit

//Equatable: protocol dùng để so sánh 2 struct
//nếu có 1 thuộc tính là 1 struct khác thì phải tự implement thêm 1 func ==, và struct kia cũng phải thêm Equatable
//so sánh lớn nhỏ thì thêm Comparable
struct Car: Equatable, Comparable {
    static func < (lhs: Car, rhs: Car) -> Bool {
        return lhs.make > rhs.make
    }
    
    
    
    let make: String
    let model: String
    let owner : Person
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.make == rhs.make && lhs.model == rhs.model && lhs.owner.name == rhs.owner.name
    }
}
struct Person: Equatable {
    let name: String
}

var bmw = Car(make: "bmw",
              model: "5 seri",
              owner: Person(name: "anh1"))
var bmw2 = Car(make: "bmw",
              model: "5 seri",
              owner: Person(name: "anh1"))

var vinfast = Car(make: "vinfast",
               model: "vf8",
               owner: Person(name: "anh2"))

if bmw == bmw2 {
    print("same")
} else {
    print("difference")
}


if bmw == vinfast {
    print("same")
} else {
    print("difference")
}
if bmw > vinfast {
    print("true")
} else {
    print("false")
}


//Nếu muốn lấy 1 struc làm key thì phải comform thêm Hashable
//Thêm hàm hash để biết lấy cái gì làm giá trị
// thêm hàm của Equatable để biết nó có phải là duy nhất ko
struct Person2{
    let name:String
}
struct UserAccount: Hashable {
    
    let accountIdentifier: Person2
    static func == (lhs: UserAccount, rhs: UserAccount) -> Bool {
        return lhs.accountIdentifier.name == rhs.accountIdentifier.name
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(accountIdentifier.name)
    }
    
}
struct Post {
    let text: String
}

var dictionary:[UserAccount: [Post]] = [
    UserAccount(accountIdentifier: Person2(name: "A")) : [Post(text: "first")],
    UserAccount(accountIdentifier: Person2(name: "b")) : [Post(text: "second")]
    
]

let post = dictionary[UserAccount(accountIdentifier: Person2(name: "A"))]
print(post!)
