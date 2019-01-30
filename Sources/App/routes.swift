import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "Welcome to Tests Interface. Run /run?device=DEVICE_NAME&simulator=true&email=true"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = AppiumController()
//    router.get("run", String.parameter, String.parameter, use: todoController.run)
    router.get("run", use: todoController.run)
}
