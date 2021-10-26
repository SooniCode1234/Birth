//
//  QuestionCardView.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-26.
//

import SwiftUI

struct QuestionCardView: View {
    
    /// Variable to know what question to display the information for
    let question: Question
    /// Binding so that we can change the progress here and then pass it back to the parent screen (QuestionsScreen)
    @Binding var progress: CGFloat
    /// Reading the ViewModel as a EnvironmentObject in the entire App
    @EnvironmentObject private var model: ViewModel
    
    var body: some View {
        // Main Stack
        VStack(alignment: .leading, spacing: 24) {
            // Informational Text
            VStack(alignment: .leading, spacing: 8) {
                Text(question.title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.02, blue: 0.37, alpha: 1)))
                
                Text("Select one of the options")
                    .font(.callout)
                    .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.02, blue: 0.37, alpha: 0.7)))
            }
            
            // List of button for each option in the passed in question
            VStack(spacing: 16) {
                ForEach(question.options) { option in
                    DIOptionButton(option.title) {
                        // Adds the current tapped on option to the list of selectedOptions
                        model.selectedOptions.append(option)
                        
                        // Adds the passed in question to the list of completedQuestions and updates the progress
                        model.completedQuestions.append(question)
                        progress += (1/10)
                        
                        // Removes the passed in question from the question bank with a animation and delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.easeInOut) {
                                model.questionBank.removeAll(where: { $0.id == question.id })
                            }
                        }
                    }
                }
            }
        }
        .padding(20)
        .frame(width: 350, height: 490)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}
struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView(question: .init(title: "I have been able to laugh and see the funny side of things",
                                         options: [Option(title: "As much as I always could", value: 0),
                                                   Option(title: "Not quite so much now", value: 1),
                                                   Option(title: "Definitely not so much now", value: 2),
                                                   Option(title: "Not at all", value: 3)]),
                         progress: .constant(50))
            .environmentObject(ViewModel())
    }
}
