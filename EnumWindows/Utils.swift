//
//  Utils.swift
//  EnumWindows
//
//  Created by Ali Lozano on 7/23/20.
//  Copyright © 2020 Igor Mandrigin. All rights reserved.
//

import Foundation

let debug = false

func timeit<T>(label: String, _ fn: () -> T) -> T {
    
    if !debug { return fn() }
    
    print(">>>> Starting: " + label)
    let start = DispatchTime.now() // <<<<<<<<<< Start time
    
    let result = fn()
    
    let end = DispatchTime.now()   // <<<<<<<<<<   end time
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print(">>>> Ending " + label + ": " + String(timeInterval))
    
    return result;
}
