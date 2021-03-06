//
//  ViewModel.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import Foundation

/// Controls the App logic
final class ViewModel: ObservableObject {
    /// Tracks the selections of the user
    @Published var selectedOptions: [Option?] = []
    /// Tracks the completed questions answered by the user
    @Published var completedQuestions: [Question] = []
    /// Holds the questions
    @Published var questionBank: [Question] = [
        .init(title: "I have been able to laugh and see the funny side of things",
              options: [Option(title: "As much as I always could", value: 0),
                        Option(title: "Not quite so much now", value: 1),
                        Option(title: "Definitely not so much now", value: 2),
                        Option(title: "Not at all", value: 3)]),
        
        .init(title: "I have looked forward with enjoyment to things",
              options: [Option(title: "As much as I ever did", value: 0),
                        Option(title: "Rather less than I used to", value: 1),
                        Option(title: "Definitely less than I used to", value: 2),
                        Option(title: "Hardly at all", value: 3)]),
    
        .init(title: "I have blamed myself unnecessarily when things went wrong",
              options: [Option(title: "No, never", value: 0),
                        Option(title: "Not very often", value: 1),
                        Option(title: "Yes, some of the time", value: 2),
                        Option(title: "Yes, most of the time", value: 3)]),
    
        .init(title: "I have been anxious or worried for no good reason",
              options: [Option(title: "No, not at all", value: 0),
                        Option(title: "Hardly ever", value: 1),
                        Option(title: "Yes, sometimes", value: 2),
                        Option(title: "Yes, very often", value: 3)]),
    
        .init(title: "I have felt scared or panicky for no very good reason",
              options: [Option(title: "No, not at all", value: 0),
                        Option(title: "No, not much", value: 1),
                        Option(title: "Yes, sometimes", value: 2),
                        Option(title: "Yes, quite a lot", value: 3)]),
    
        .init(title: "Things have been getting on top of me",
              options: [Option(title: "No, I have been coping as well as ever", value: 0),
                        Option(title: "No, most of the time I have coped quite well", value: 1),
                        Option(title: "Yes, sometimes I haven???t been coping as well as usual", value: 2),
                        Option(title: "Yes, most of the time I haven???t been able to cope", value: 3)]),
    
        .init(title: "I have been so unhappy that I have had difficulty sleeping",
              options: [Option(title: "No, not at all", value: 0),
                        Option(title: "Not very often", value: 1),
                        Option(title: "Yes, sometimes", value: 2),
                        Option(title: "Yes, most of the time", value: 3)]),
    
        .init(title: "I have felt sad or miserable",
              options: [Option(title: "No, not at all", value: 0),
                        Option(title: "Not very often", value: 1),
                        Option(title: "Yes, quite often", value: 2),
                        Option(title: "Yes, most of the time", value: 3)]),
    
        .init(title: "I have been so unhappy that I have been crying",
              options: [Option(title: "No, never", value: 0),
                        Option(title: "Only occasionally", value: 1),
                        Option(title: "Yes, quite often", value: 2),
                        Option(title: "Yes, most of the time", value: 3)]),
    
        .init(title: "The thought of harming myself has occurred to me",
              options: [Option(title: "Never", value: 0),
                        Option(title: "Hardly ever", value: 1),
                        Option(title: "Sometimes", value: 2),
                        Option(title: "Yes, quite often", value: 3)])
    ]

    
    /// Function to get the diagnosis based on the sum of the selectedOption values
    /// - Returns: A String diagnosis
    func getApproximateDiagnosis() -> String {
        // Got getting the sum from https://stackoverflow.com/questions/24795130/finding-sum-of-elements-in-swift-array
        let scoreValues  = selectedOptions.compactMap { $0?.value }
        let scoreSum     = scoreValues.reduce(.zero, +)
        var diagnosis    = ""
        
        // Making sure the self-harm question is below 0, otherwise escape the function
        guard let lastScore = scoreValues.last, lastScore <= 0 else {
            return "Thoughts of Self-Harm"
        }
        
        if scoreSum <= 8 {
            diagnosis = "Depression not likely"
        } else if scoreSum >= 9 && scoreSum <= 11 {
            diagnosis = "Depression possible"
        } else if scoreSum >= 12 && scoreSum <= 13 {
            diagnosis = "Depression highly possible"
        } else {
            diagnosis = "Probable depression"
        }
        
        return diagnosis
    }
    
    /// Function summarizes what the user should do next based on the sum of the selectedOption values
    /// - Returns: A String of some plan of action
    func getPlanOfAction() -> String {
        // Got getting the sum from https://stackoverflow.com/questions/24795130/finding-sum-of-elements-in-swift-array
        let scoreValues  = selectedOptions.compactMap { $0?.value }
        let scoreSum     = scoreValues.reduce(.zero, +)
        var diagnosis    = ""
        
        // Making sure the self-harm question is below 0, otherwise escape the function
        guard let lastScore = scoreValues.last, lastScore <= 0 else {
            return "Immediate discussion required with a Primary Care Physician and/or mental health specialist."
        }
        
        if scoreSum <= 8 {
            diagnosis = "Continue support."
        } else if scoreSum >= 9 && scoreSum <= 11 {
            diagnosis = "Retake the questionnaire and consider going to your local Primary Care Physician."
        } else if scoreSum >= 12 && scoreSum <= 13 {
            diagnosis = "Keep assessing and logging how you're feeling each day, go to a counsellor and learn more about depression."
        } else {
            diagnosis = "Go to your Primary Care Physician to get a formal / professional assessment and see if treatment is required."
        }
        
        return diagnosis
    }
}
