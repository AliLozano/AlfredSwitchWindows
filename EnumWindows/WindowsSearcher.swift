//
//  WindowsSearcher.swift
//  EnumWindows
//
//  Created by Ali Lozano on 7/23/20.
//  Copyright © 2020 Igor Mandrigin. All rights reserved.
//

import Foundation

func listWindows(results: inout [AlfredItem]) {
    let allActiveWindows : [WindowInfoDict] = Windows.all
    results.append(contentsOf: allActiveWindows.compactMap { $0 })
}
