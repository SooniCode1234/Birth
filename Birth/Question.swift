//
//  Question.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import Foundation

/// Structure to represent a Question
struct Question: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let options: [Option]
}

/// Structure to represent a Option
struct Option: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let value: Int
}
