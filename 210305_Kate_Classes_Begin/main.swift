//
//  main.swift
//  210305_Kate_Classes_Begin
//
//  Created by Siarhei Siliukou on 19.02.21.
//

import Foundation


let linkedList = LinkedList()
// This is develop branch

print("Program begun...")

var quit: Bool = false

while quit == false {
    print("Type command ('push', 'append', 'print' or 'exit'): ")
    let command = readLine()

    switch command?.lowercased() {
    case "exit":
        quit = true
    case "push":
        pushCommand()
    case "append":
        appendCommand()
    case "print":
        printCommand()
    default:
        print("Unknown command...")
    }
}

print("Program ended...")

func pushCommand() {
    let stringOptionalNumValue = readLine()
    
    if let stringNumValue = stringOptionalNumValue, let num = Int(stringNumValue) {
        linkedList.push(num)
    } else {
        print("Num push error casting...")
    }
}

func appendCommand() {
    
}

func printCommand() {
    print(linkedList.description)
}
