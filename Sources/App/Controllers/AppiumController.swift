import Foundation
import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class AppiumController {
    /// Returns a list of all `Todo`s.

    
    func run(_ req: Request) throws -> String {
        
        
        let query = try? req.query.decode(Parameter.self)
        
        guard let param = query else {
            return "Send parameters: {device} and {simulator} and {email}"
        }
        
        let arguments = [
            "SEND_REPORT=\(param.email ?? "false")",
            "IOS_SIMULATOR=\(param.simulator ?? "false")",
            "npm",
            "run",
            param.device,
            "--prefix",
            "/Users/eduardofinotti/Documents/Projetos/interface-test-mobile"
        ]
        
        if let a = shellReturn(launchPath: "/usr/bin/env", arguments: arguments) {
            return a
        }

        return "No data avaliable"
    }

    func shellReturn(launchPath: String, arguments: [String]) -> String? {
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
