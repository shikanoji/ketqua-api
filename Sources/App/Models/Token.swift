//
//  File.swift
//  
//
//  Created by Nguyễn Đình Thạch on 18/03/2021.
//

import Foundation
import Vapor
import Fluent

enum SessionSource: Int, Content {
    case signup
    case login
}

//1
final class Token: Model {
    //2
    static let schema = "tokens"
    
    @ID(key: "id")
    var id: UUID?
    
    //3
    @Parent(key: "user_id")
    var user: User
    
    //4
    @Field(key: "value")
    var value: String
    
    //5
    @Field(key: "source")
    var source: SessionSource
    
    //6
    @Field(key: "expires_at")
    var expiresAt: Date?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, userId: User.IDValue, token: String,
         source: SessionSource, expiresAt: Date?) {
        self.id = id
        self.$user.id = userId
        self.value = token
        self.source = source
        self.expiresAt = expiresAt
    }
}
