//
//  LinkedList.swift
//  210305_Kate_Classes_Begin
//
//  Created by Katerina Ulasik on 05.03.2021.
//

import Foundation
protocol LinkedList {
    var head: Node { get set }
    var tail: Node { get set }
    func push(_ node: Node)
    func append(_ node: Node)
    func insert(_ node: Node)
}
