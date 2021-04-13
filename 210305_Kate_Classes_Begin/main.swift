//
//  main.swift
//  210305_Kate_Classes_Begin
//
//  Created by Siarhei Siliukou on 19.02.21.
//

import Foundation


var linkedList = LinkedList<Int>()
linkedList.append(68)
linkedList.append(68)
linkedList.append(68)
linkedList.append(69)

let description = linkedList.description
print("OUR Linked List Now \(description)")

MusicPlayerManager.sharedInstance.playNotes(notes: linkedList)
sleep(3)

//print("Program begun...")
//
//var quit: Bool = false
//
//while quit == false {
//    print("Type command ('push', 'append', 'print', 'play' or 'exit'): ")
//    let command = readLine()
//
//    switch command?.lowercased() {
//    case "exit":
//        quit = true
//    case "push":
//        pushCommand()
//    case "append":
//        appendCommand()
//    case "print":
//        printCommand()
//    case "play":
//        playCommand()
//    default:
//        print("Unknown command...")
//    }
//}
//
//print("Program ended...")
//
//func pushCommand() {
//    let stringOptionalNumValue = readLine()
//
//    if let stringNumValue = stringOptionalNumValue, let num = Int(stringNumValue) {
//        linkedList.push(num)
//    } else {
//        print("Num push error casting...")
//    }
//}
//
//func appendCommand() {
//
//}
//
//func printCommand() {
//    print(linkedList.description)
//}
//
//func playCommand() {
//    MusicPlayerManager.sharedInstance.playNotes(notes: linkedList)
//}
//
//
