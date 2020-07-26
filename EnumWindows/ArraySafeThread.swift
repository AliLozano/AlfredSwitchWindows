//
//  ArraySafeThread.swift
//  EnumWindows
//
//  Created by Ali Lozano on 7/25/20.
//  Copyright © 2020 Igor Mandrigin. All rights reserved.
//

import Foundation


class SharedSynchronizedArray<T> {
    var array = [T]()
    let operationQueue = DispatchQueue(label: "SharedSynchronizedArray")

    func append(_ newElement: T) {
        operationQueue.sync {
            array.append(newElement)
        }
    }
}

final class ThreadSafe<A> {
    private var _value: A
    private let queue = DispatchQueue(label: "ThreadSafe")
    init(_ value: A) {
        self._value = value
    }
    
    var value: A {
        return queue.sync { _value }
    }
    
     func atomically(_ transform: (inout A) -> ()) {
         queue.sync {
             transform(&self._value)
         }
     }
}

extension Array {

    func concurrentMap<B>(_ transform: @escaping (Element) -> B) -> [B] {
        self.concurrentMap { (element, idx ) in transform(element) }
    }

    
    func concurrentMap<B>(_ transform: @escaping (Element, Int) -> B) -> [B] {
        let result = ThreadSafe(Array<B?>(repeating: nil, count: count))
        DispatchQueue.concurrentPerform(iterations: count) { idx in
            let element = self[idx]
            let transformed = transform(element, idx)
            result.atomically {
                $0[idx] = transformed
            }
        }
        return result.value.map { $0! }

    }

}
