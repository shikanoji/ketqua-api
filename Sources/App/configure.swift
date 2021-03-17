import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "ketqua",
        password: Environment.get("DATABASE_PASSWORD") ?? "123456",
        database: Environment.get("DATABASE_NAME") ?? "ketqua"
    ), as: .psql)

    app.migrations.add(CreateTodo())

    // register routes
    try routes(app)
}
