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
    var match : [String] { ["Browser", getTLD(self.url), self.title, self.processName] };
    var autocomplete : String { return self.title };
    var subtitle : String { return "\(self.url)" };
}



func getTLD(_ urlBase:String) -> String {
    guard let url = URL(string: urlBase) else {
        return urlBase
    }
    let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
    return components?.host ?? urlBase
}
