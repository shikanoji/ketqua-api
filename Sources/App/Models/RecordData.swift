//
//  File.swift
//  
//
//  Created by Nguyễn Đình Thạch on 17/03/2021.
//

import Foundation
import ObjectMapper

class RecordData: Mappable, Codable {
    var date: String?
    var special: String?
    var first: String?
    var second: [String]?
    var third: [String]?
    var fourth: [String]?
    var fifth: [String]?
    var sixth: [String]?
    var seventh: [String]?

    required init?(map: Map) { }

    // Mappable
    func mapping(map: Map) {
        date    <- map["date"]
        special <- map["special"]
        first   <- map["first"]
        second  <- map["second"]
        third   <- map["third"]
        fourth  <- map["fourth"]
        fifth   <- map["fifth"]
        sixth   <- map["sixth"]
        seventh <- map["seventh"]
    }
}
