//
//  ResultsScreen.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-25.
//

import SwiftUI

struct ResultsScreen: View {
    
    @EnvironmentObject private var model: ViewModel
   
    @State private var showQuestionsScreen = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.0117647061124444, green: 0.01568627543747425, blue: 0.3686274588108063, alpha: 1))
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                Image("result-success")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350.0)

                VStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 12.0) {
                        Text("Results")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.02, blue: 0.37, alpha: 1)))
                        
                        Text("Based on the data you have given us, we were able to deduce the likelihood of you having depression")
                            .font(.callout)
                            .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.02, blue: 0.37, alpha: 0.7)))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .layoutPriority(3)

                    Text(model.getApproximateDiagnosis())
                        .font(.headline)
                        .foregroundColor(.accentColor)
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(15)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .stroke(Color.accentColor)
                        }

                    VStack(alignment: .leading, spacing: 12.0) {
                        Text("Action")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.02, blue: 0.37, alpha: 1)))
                        
                        Text(model.getPlanOfAction())
                            .font(.callout)
                            .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.02, blue: 0.37, alpha: 0.7)))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .layoutPriority(2)
                    
                    Spacer()
                    
                    BIButton("Redo Assessment") {
                        model.completedQuestions = []
                        model.questionBank       = [
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
                        showQuestionsScreen      = true
                    }
                    .padding(.bottom, 40)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .background(Color.white)
                .customCornerRadius(30, corners: [.topLeft, .topRight])
                .ignoresSafeArea(edges: .bottom)
                .fullScreenCover(isPresented: $showQuestionsScreen) {
                    QuestionsScreen()
                        .environmentObject(model)
                }
            }
        }
    }
}

struct ResultsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultsScreen()
            .environmentObject(ViewModel())
    }
}
