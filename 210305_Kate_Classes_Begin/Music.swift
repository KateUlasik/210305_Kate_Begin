//
//  Music.swift
//  210305_Kate_Classes_Begin
//
//  Created by Siarhei Siliukou on 29.03.21.
//

import Foundation
import AudioToolbox

class MusicPlayerManager {
    let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    static let sharedInstance = MusicPlayerManager()
    private init() {}
    
    var musicPlayer : MusicPlayer? = nil
    var sequence : MusicSequence? = nil
    var track : MusicTrack? = nil
    var time = MusicTimeStamp(1.0)
    var player: OSStatus? = nil
    var musicTrack: OSStatus? = nil
    
    func playNotes(notes linkedList: LinkedList) {
        _ = NewMusicSequence(&self.sequence)
        self.player = NewMusicPlayer(&self.musicPlayer)
        self.player = MusicPlayerSetSequence(self.musicPlayer!, self.sequence)
        self.player = MusicPlayerStart(self.musicPlayer!)
        self.musicTrack = MusicSequenceNewTrack(self.sequence!, &self.track)
        
        var currentNode: Node? = linkedList.head
        
        repeat {
            if let value = currentNode?.value {
                var midiNote = MIDINoteMessage(channel: 0,
                                               note: UInt8(value),
                                               velocity: 64,
                                               releaseVelocity: 0,
                                               duration: 1.0)
                
                guard let track = track else { fatalError() }
                musicTrack = MusicTrackNewMIDINoteEvent(track, time, &midiNote)
                time += 1
            }
            
            currentNode = currentNode?.next
        } while currentNode != nil
        
        self.player = MusicPlayerSetSequence(self.musicPlayer!, self.sequence)
        self.player = MusicPlayerStart(self.musicPlayer!)
    }
    
}

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

var list = LinkedList<Int>()
//list.push("k")
//list.push("a")
//list.push("m")

list.append(10)
list.append(3)
list.append(2)

//let middleNode = list.node(at: 2)!
//list.insert(9, after: middleNode)
//print(list)
//
//print("Before popping list")
//print(list)
//
//print("After popping list")
//list.pop()
//print(list)
//
//print("before removing last")
//print(list)
//
//print("after removing last")
//list.removeLast()
//print(list)


print("before removing")
print(list)

let index = 1
let node = list.node(at: index - 1)!
let removedValue = list.remove(after: node)

print("after removing")
print(list)
