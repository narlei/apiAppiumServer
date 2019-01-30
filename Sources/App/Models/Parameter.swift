import FluentSQLite
import Vapor

/// A single entry of a Todo list.
public struct Parameter: Decodable {
    /// The unique identifier for this `Todo`.
    var simulator: String?
    var email: String?

    /// A title describing what this `Todo` entails.
    var device: String

    /// Creates a new `Todo`.
    init(simulator: String?, email: String?, device: String) {
        self.email = email
        self.device = device
        self.simulator = simulator
    }
}
