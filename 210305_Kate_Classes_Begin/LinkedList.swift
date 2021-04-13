//
//  LinkedList.swift
//  210305_Kate_Classes_Begin
//
//  Created by Katerina Ulasik on 05.03.2021.
//

import Foundation

struct LinkedList<Value>{
    
    var head :Node<Value>?
    var tail :Node<Value>?
    
    var isEmpty :Bool {
        return head == nil
    }
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    
    func node(at index:Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        
        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    func insert(_ value :Value, after node :Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }
    
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        let node = Node(value: value)
        tail!.next = node
        tail = node
    }
    
    mutating func pop() -> Value? {
        
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
        
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    mutating func remove(after node: Node<Value>) -> Value? {
        
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    init() {}
}

extension LinkedList :CustomStringConvertible {
    var description :String {
        
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
        
    }
}
