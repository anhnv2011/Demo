//
//  Book.swift
//  DemoFirebase
//
//  Created by MAC on 8/4/22.
//

import Foundation
struct JSON {
    static let encoder = JSONEncoder()
}
struct Book: Codable {
    var id: String
    var name:String
    var author:String
    var creatAt:String
    var price: Float
}
extension Encodable {
    var dictionary: [String: Any]{
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String:Any] ?? [:]
        
        }
    subscript(key: String) -> Any? {
        return dictionary[key]
    
    }
    
}
