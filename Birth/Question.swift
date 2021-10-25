//
//  Question.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import Foundation

struct Question: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let options: [Option]
    var selectedOption: Option? = nil
}

struct Option: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let value: Int
}
