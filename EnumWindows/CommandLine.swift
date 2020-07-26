import Foundation

protocol AppCommand {
    static var query: String? { get };
    static var includeWindows: Bool { get };
    static var includeTabs: Bool { get };
}
extension CommandLine: AppCommand {
    static func getArgv(_ argName: String) -> String?{
        var value: String? = nil
        let argName = "--" + argName
        self.arguments.forEach({ (arg: String) in
            if(arg.hasPrefix(argName)){
                value = arg
                .replacingOccurrences(of: argName + "=", with: "")
                .replacingOccurrences(of: argName, with: "") // for "--argName" without =
                .replacingOccurrences(of: "\"", with: "")
            }
        })
        return value
    }
    static var query: String? {
        return self.getArgv("query")
    }
    
    static var includeWindows: Bool {
        return self.getArgv("windows") != nil
    }
    
    static var includeTabs: Bool {
        return self.getArgv("tabs") != nil
    }
    
}

