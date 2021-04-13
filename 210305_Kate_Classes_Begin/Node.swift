//
//  Node.swift
//  210305_Kate_Classes_Begin
//
//  Created by Katerina Ulasik on 05.03.2021.
//

import Foundation

class Node<Value> {
    
    var value :Value
    var next :Node?
    
    init(value :Value, next :Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node :CustomStringConvertible {
    
    var description :String {
        
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

