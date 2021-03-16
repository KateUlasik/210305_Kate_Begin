//
//  main.swift
//  210305_Kate_Classes_Begin
//
//  Created by Siarhei Siliukou on 19.02.21.
//

import Foundation

print("Program begun...")

var quit: Bool = false

while quit == false {
    print("Type command ('sum' or 'exit' or 'times'): ")
    let command = readLine()
    
    switch command?.lowercased() {
    case "exit":
        quit = true
    case "sum":
        sumCommandProcess()
    case "times":
        timesCommandProcess()
    default:
        print("Unknown command...")
    }
}

print("Program ended...")

func sumCommandProcess() {
    print("Please add first number:")
    let firstNumberStr = readLine()
    
    print("Please add second number:")
    let secondNumberStr = readLine()
    
    let firstNumber: Double
    let secondNumber: Double
    
    if let fns = firstNumberStr, let fn = Double(fns) {
        firstNumber = fn
    } else {
        firstNumber = 0
        print("Error. Unknown first number")
        return
    }
    
    if let sns = secondNumberStr, let sn = Double(sns) {
        secondNumber = sn
    } else {
        secondNumber = 0
        print("Error. Unknown second number")
        return
    }
    
    print("\(firstNumber) + \(secondNumber) = \(firstNumber + secondNumber)")
}

func timesCommandProcess() {
//    todo
    print("Please add first number:")
    let firstNumberString = readLine()
    
    print("Please add second number:")
    let secondNumberString = readLine()
    
    let firstNumber1: Double
    let secondNumber2: Double
    
    if let fNStr = firstNumberString, let fNumb = Double(fNStr) {
        firstNumber1 = fNumb
    } else {
        firstNumber1 = 0
        print("Error. Unknown first number")
        return
    }
    
    if let sNStr = secondNumberString, let sNumb = Double(sNStr) {
        secondNumber2 = sNumb
    } else {
        secondNumber2 = 0
        print("Error. Unknown second number")
        return
    }
    
    print("\(firstNumber1) + \(secondNumber2) = \(firstNumber1 * secondNumber2)")
}

