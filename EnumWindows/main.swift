import Foundation


requestOSXPermissions()


func search(_ query: String?, windows: Bool, tabs: Bool) -> [AlfredItem] {
    var result: [AlfredItem] = [];
    if(windows) {
        listWindows(results: &result); ///  inout
    }
    if(tabs) {
        listTabs(results: &result); ///  inout
    }
    
    if query?.isEmpty ?? true { // if not query
        return result
    }
    
    let query = query?.lowercased() // if there are query.
    return result.filter { (item) -> Bool in
        item.match.joined().lowercased().contains(query?.lowercased() ?? "")
    }
}

// -> main

if !debug {
    let results = search(CommandLine.query, windows: CommandLine.includeWindows, tabs: CommandLine.includeTabs);
    printAlfred(results)
    exit(0)
}




timeit(label: "Test only one", {
    let testResults = search("xcode", windows: true, tabs: true);
   printAlfred(testResults)
})
