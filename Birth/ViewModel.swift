//
//  ViewModel.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import Foundation

/*
 - Holds a array of questions [x]
 - A variable that tracks the selected option of each question
     - Starts out as having 9 nil values [x]
     - Every time the user selects a option from a specific question, map out the selected option from the questtion and add it to the array
     - If the user goes back and changes their answer, update that index
 - At the end, tally up all the selections's value
 - Display correct info
 */

final class ViewModel: ObservableObject {
    @Published var selectedOptions: [UUID: Option?] = [:]
    @Published var completedQuestions: [Question] = []
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
                        Option(title: "Yes, sometimes I haven’t been coping as well as usual", value: 2),
                        Option(title: "Yes, most of the time I haven’t been able to cope", value: 3)]),
    
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

}
