//
//  File.swift
//  
//
//  Created by nguyen.dinh.thach on 17/03/2021.
//

import Fluent
import Vapor

enum RecordType: String, Codable {
    case special = '00'
    case first = '01'
    case second = '02'
    case third = '03'
    case fourth = '04'
    case fifth = '05'
    case sixth = '06'
    case seventh = '07'
}

final class Record: Model, Content {
    static let schema = "records"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "date")
    var date: String
    
    @Field(key: "values")
    var values: [String]
    
    @Field(key: "type")
    var type: RecordType
    
    init() { }
    
}
