import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class Test: SQLiteModel {
    /// The unique identifier for this `Todo`.
    var id: Int?

    /// A title describing what this `Todo` entails.
    var title: String

    /// Creates a new `Todo`.
    init(id: Int? = nil, title: String) {
        self.id = id
        self.title = title
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Test: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Test: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Test: Parameter { }