//
//  name.swift
//  Assignment3
//
//  Created by user225812 on 3/26/23.
//

import Foundation

struct Name: Identifiable {
    let id = UUID()
    let name: String
}

let sampleNames = [
    Name(name: "George"),
    Name(name: "John"),
    Name(name: "Henry"),
    Name(name: "Ella"),
    Name(name: "Susan")
]
