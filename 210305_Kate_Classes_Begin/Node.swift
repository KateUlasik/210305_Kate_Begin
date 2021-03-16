//
//  Node.swift
//  210305_Kate_Classes_Begin
//
//  Created by Katerina Ulasik on 05.03.2021.
//

import Foundation

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        if let n = next {
            return "\(value) -> \(String(describing: n))"
        } else {
            return "\(value)"
        }
    }
}
