//
//  Anime.swift
//  DemoURLSession
//
//  Created by MAC on 7/26/22.
//

import Foundation
import SwiftyJSON

struct Anime {

    let success: Bool?
    let data: [Data]?

    init(_ json: JSON) {
        success = json["success"].boolValue
        data = json["data"].arrayValue.map { Data($0) }
    }

}
struct Data {

    let animeId: Int?
    let animeName: String?
    let animeImg: String?

    init(_ json: JSON) {
        animeId = json["anime_id"].intValue
        animeName = json["anime_name"].stringValue
        animeImg = json["anime_img"].stringValue
    }

}
