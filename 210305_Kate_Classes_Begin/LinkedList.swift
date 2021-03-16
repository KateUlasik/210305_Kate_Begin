//
//  LinkedList.swift
//  210305_Kate_Classes_Begin
//
//  Created by Katerina Ulasik on 05.03.2021.
//

import Foundation

class LinkedList {
    var head: Node? = nil
    var tail: Node? = nil
        
    func push(_ value: Int) {
        let newNode = Node(value: value)
        newNode.next = head
        
        head = newNode
        
        if tail == nil {
            tail = head
        }
    }
    
    func append(_ value: Int) {
        if head == nil {
            push(value)
        } else {
            let newNode = Node(value: value)
            let oldTail = self.tail
            oldTail?.next = newNode
            
            self.tail = newNode
        }
    }
    
    func insert(_ value: Int) {
        
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        if let h = head {
            return h.description
        } else {
            return "Linked list is empty"
        }
    }
}
