//
//  Item.swift
//  MemoryLeaks
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import Foundation

struct Item: Identifiable, Hashable {
    let id: String
    let title: String
}


extension Item {
    static let all: [Item] = [
        .init(id: "1", title: "Item 1"),
        .init(id: "2", title: "Item 2"),
        .init(id: "3", title: "Item 3"),
        .init(id: "4", title: "Item 4"),
        .init(id: "5", title: "Item 5")
    ]
}
