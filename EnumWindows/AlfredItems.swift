import Foundation

extension WindowInfoDict : AlfredItem {
    var uid : String { return "1" };
    var autocomplete : String { return self.name };
    var match : [String] { [self.processName, self.name]  };
    var title : String { return self.name };
    var subtitle : String { return "Open Window: \(self.processName)" };
    var arg: AlfredArg { return AlfredArg(self.processName, "\(self.tabIndex)", self.title) }
}

extension BrowserTab : AlfredItem {
    var uid : String { return "1" };
    var arg: AlfredArg { return AlfredArg( self.processName, "\(self.tabIndex)", self.windowTitle) }
    var match : [String] { ["Browser", self.url, self.title, self.processName] };
    var autocomplete : String { return self.title };
    var subtitle : String { return "\(self.url)" };
}
