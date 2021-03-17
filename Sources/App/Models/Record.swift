//
//  File.swift
//  
//
//  Created by nguyen.dinh.thach on 17/03/2021.
//

import Foundation

final class Record: Model {
    static let schema = "records"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "date")
    var date: String
    
    @Field(key: "type")
    var type: String
    
    @Field(key: "values")
    var type: Array
    
    init() { }
    
}
