//
//  Post.swift
//  DemoURLSession
//
//  Created by MAC on 7/23/22.
//

import Foundation
import SwiftyJSON
struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    init() {
        userId = 0
        id = 0
        title = ""
        body = ""
    }
    init(_ json: JSON) {
            userId = json["userId"].intValue
            id = json["id"].intValue
            title = json["title"].stringValue
            body = json["body"].stringValue
        }
}
