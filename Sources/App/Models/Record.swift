//
//  File.swift
//  
//
//  Created by nguyen.dinh.thach on 17/03/2021.
//

import Fluent
import Vapor

final class Record: Model, Content {
    static let schema = "records"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "data")
    var data: RecordData
    
    init() { }
    
}
