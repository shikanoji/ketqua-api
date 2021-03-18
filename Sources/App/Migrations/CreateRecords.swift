//
//  File.swift
//  
//
//  Created by Nguyễn Đình Thạch on 18/03/2021.
//

import Fluent

struct CreateRecords: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("records")
            .id()
            .field("data", RecordData, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("todos").delete()
    }
}
