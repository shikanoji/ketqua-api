import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    encoder.dateEncodingStrategy = .iso8601
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .iso8601
    
    ContentConfiguration.global.use(encoder: encoder, for: .json)
    ContentConfiguration.global.use(decoder: decoder, for: .json)

    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "ketqua",
        password: Environment.get("DATABASE_PASSWORD") ?? "123456",
        database: Environment.get("DATABASE_NAME") ?? "ketqua"
    ), as: .psql)

    app.middleware.use(ErrorMiddleware.default(environment: app.environment))
    app.migrations.add(CreateUsers())
    app.migrations.add(CreateTokens())
    app.migrations.add(CreateRecords())
    try app.autoMigrate().wait()
    // register routes
    try routes(app)
}
