//
//  File.swift
//  
//
//  Created by Nguyễn Đình Thạch on 17/03/2021.
//

import Fluent
import Vapor

struct RecordController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let records = routes.grouped("records")
        records.get(use: index)
        records.post(use: create)
    }

    func index(req: Request) throws -> EventLoopFuture<[Record]> {
        return Record.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Record> {
        let record = try req.content.decode(Record.self)
        return record.save(on: req.db).map { record }
    }

}

