//
//  AnimeFactsRoute.swift
//  DemoURLSession
//
//  Created by MAC on 7/26/22.
//

import Foundation
import SwiftyJSON

struct AnimeFactsRoute {

    let success: Bool?
    let img: String?
    let totalFacts: Int?
    let data: [Data2]?

    init(_ json: JSON) {
        success = json["success"].boolValue
        img = json["img"].stringValue
        totalFacts = json["total_facts"].intValue
        data = json["data"].arrayValue.map { Data2($0) }
    }

}
struct Data2 {

    let factId: Int?
    let fact: String?

    init(_ json: JSON) {
        factId = json["fact_id"].intValue
        fact = json["fact"].stringValue
    }

}
