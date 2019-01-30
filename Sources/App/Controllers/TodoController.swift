import Vapor
import Foundation


/// Controls basic CRUD operations on `Todo`s.
final class TodoController {
    /// Returns a list of all `Todo`s.
    
    
    func show(_ req: Request) throws -> String {
//        shell("code", "/Users/narlei/sources/ios/app-ios-2.0")
        let a = shellReturn(launchPath: "/usr/bin/env", arguments: ["fastlane", "teste"])
//        shell("cd", "/Users/narlei/sources/ios/app-ios-2.0", "&", "code", ".")
        return a ?? "Nada"
    }
    
    func index(_ req: Request) throws -> Future<[Todo]> {
//        shell("code", " /docs.txt")
        return Todo.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Todo> {
        return try req.content.decode(Todo.self).flatMap { todo in
            return todo.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Todo.self).flatMap { todo in
            return todo.delete(on: req)
        }.transform(to: .ok)
    }
    
    func shellReturn(launchPath: String, arguments: [String]) -> String?
    {
        let task = Process()
        task.launchPath = launchPath
        task.arguments = arguments
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: String.Encoding.utf8)
        
        return output
    }
    
    @discardableResult
    func shell(_ args: String...) -> Int32 {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
        task.waitUntilExit()
        return task.terminationStatus
    }

}
