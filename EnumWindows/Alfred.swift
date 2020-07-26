import Foundation

struct AlfredArg {
    private let arg1 : String
    private let arg2 : String
    private let arg3 : String
    
    init(_ arg1: String,_ arg2: String,_ arg3: String) {
        self.arg1 = arg1
        self.arg2 = arg2
        self.arg3 = arg3
    }
    
    var serialized : String {
        return "\(self.arg1)|||||\(self.arg2)|||||\(self.arg3)"
    }
}

protocol AlfredItem {
    var uid : String { get };
    var arg : AlfredArg { get };
    var autocomplete : String { get };
    var title : String { get };
    var match : [String] { get };
    var icon : String { get };
    var subtitle : String { get };
    var processName : String { get };
    var tabIndex : Int { get };
    
}

extension AlfredItem {
    var icon : String { return AppIcon(appName: self.processName).path };
}
