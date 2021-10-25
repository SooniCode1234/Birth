//
//  BirthApp.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import SwiftUI

@main
struct BirthApp: App {
    @StateObject private var model = ViewModel()

    var body: some Scene {
        WindowGroup {
            StartAssessmentScreen()
                .environmentObject(model)
        }
    }
}
