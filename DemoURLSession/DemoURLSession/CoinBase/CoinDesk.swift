//
//  CoinDesk.swift
//  DemoURLSession
//
//  Created by MAC on 7/26/22.
//

import Foundation
import SwiftyJSON
import Alamofire

struct CoinDesk {

    let time: Time?
    let disclaimer: String?
    let chartName: String?
    let bpi: Bpi?

    init(_ json: JSON) {
        time = Time(json["time"])
        disclaimer = json["disclaimer"].stringValue
        chartName = json["chartName"].stringValue
        bpi = Bpi(json["bpi"])
    }

}
struct Time {

    let updated: String?
    let updatedISO: String?
    let updateduk: String?

    init(_ json: JSON) {
        updated = json["updated"].stringValue
        updatedISO = json["updatedISO"].stringValue
        updateduk = json["updateduk"].stringValue
    }

}

struct Bpi {

    let USD: USD1?
    let GBP: GBP1?
    let EUR: EUR1?

    init(_ json: JSON) {
        USD = USD1(json["USD"])
        GBP = GBP1(json["GBP"])
        EUR = EUR1(json["EUR"])
    }

}
struct USD1 {

    let code: String?
    let symbol: String?
    let rate: String?
    let description: String?
    let rateFloat: Double?

    init(_ json: JSON) {
        code = json["code"].stringValue
        symbol = json["symbol"].stringValue
        rate = json["rate"].stringValue
        description = json["description"].stringValue
        rateFloat = json["rate_float"].doubleValue
    }

}
struct GBP1 {

    let code: String?
    let symbol: String?
    let rate: String?
    let description: String?
    let rateFloat: Double?

    init(_ json: JSON) {
        code = json["code"].stringValue
        symbol = json["symbol"].stringValue
        rate = json["rate"].stringValue
        description = json["description"].stringValue
        rateFloat = json["rate_float"].doubleValue
    }

}
struct EUR1 {

    let code: String?
    let symbol: String?
    let rate: String?
    let description: String?
    let rateFloat: Double?

    init(_ json: JSON) {
        code = json["code"].stringValue
        symbol = json["symbol"].stringValue
        rate = json["rate"].stringValue
        description = json["description"].stringValue
        rateFloat = json["rate_float"].doubleValue
    }

}
