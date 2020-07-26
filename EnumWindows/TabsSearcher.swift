//
//  TabsSearcher.swift
//  EnumWindows
//
//  Created by Ali Lozano on 7/23/20.
//  Copyright © 2020 Igor Mandrigin. All rights reserved.
//

import Foundation

let browserApps = ["Safari", "Safari Technology Preview",
"Google Chrome", "Google Chrome Canary",
"Opera", "Opera Beta", "Opera Developer",
"Brave Browser", "iTerm"]




func listTabs(results: inout [AlfredItem]) {

    /// Removes browser window from the list of windows and adds tabs to the results array
    results.removeAll(where: { browserApps.contains($0.processName) })
    
    let items = browserApps.concurrentMap { listTabsByProcess(processName: $0) }
    
    results.append(contentsOf: items.flatMap { $0 })
       
}

func listTabsByProcess(processName: String) -> [AlfredItem] {
    
    let browser = BrowserApplication.connect(processName: processName)
    let results = timeit(label: "Tab extraction", {
       browser?.windows.flatMap({ (window) in window.tabs })
    })
    
    return  results ?? []
}
