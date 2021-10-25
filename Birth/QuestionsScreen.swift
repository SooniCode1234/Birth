//
//  QuestionsScreen.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import SwiftUI

struct QuestionsScreen: View {
    
    @EnvironmentObject private var model: ViewModel
    @State private var showResultsScreen = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.0117647061124444, green: 0.01568627543747425, blue: 0.3686274588108063, alpha: 1))
                .ignoresSafeArea()
            
            VStack(spacing: 44) {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.headline)
//                        .frame(width: 30, height: 30)
                }
                .tint(.accentColor)
                .buttonStyle(.bordered)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 16.0) {
                    Text("Question 1 / 9")
                        .font(.title3)
                        .foregroundColor(Color(.white).opacity(0.7))
                    
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color(red: 0.008, green: 0.14, blue: 0.453))
                        .frame(height: 24)
                        .overlay(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color.accentColor)
                                .frame(width: 11 * (350 / 100))
                        }
                }
                
                ZStack(alignment: .top) {
                    ForEach(model.questionBank) { question in
                        QuestionCardView(question: question)
                            .zIndex(isTopCard(for: question) ? 1 : 0)
                            .offset(y: isTopCard(for: question) ? 0 : getOffset(for: question))
                            .opacity(isTopCard(for: question) ? 1 : 0.2)
                            .scaleEffect(isTopCard(for: question) ? 1 : scale(for: question))
                            .transition(.asymmetric(insertion: .identity,
                                                    removal: .move(edge: .trailing)
                                                             .combined(with: .move(edge: .bottom))))
                    }
                }
                
                Spacer()
            }
            .padding([.horizontal, .top], 20)
            .onChange(of: model.completedQuestions) { completedQuestions in
                print("🤨 Has completed survey: \(completedQuestions.count == 10)", completedQuestions.count)
                guard completedQuestions.count == 10 else { return }
                
                print("✅ The user is done with the survey")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                    showResultsScreen = true
                }
            }
            .fullScreenCover(isPresented: $showResultsScreen) {
                ResultsScreen()
                    .environmentObject(model)
            }
        }
    }
    
    func isTopCard(for question: Question) -> Bool {
        guard let index = model.questionBank.firstIndex(where: { $0.id == question.id }) else {
            return false
        }
        
        return index == 0
    }
    
    // To get the deck looking right, I read https://www.swiftcompiled.com/swiftui-cards/ and used the functions
    
    func getOffset(for question: Question) -> CGFloat {
        var offset: CGFloat = 0
        
        guard let index = model.questionBank.firstIndex(where: { $0.id == question.id }) else {
            return offset
        }
        
        offset = CGFloat(index) * 10
        
        
        return offset
    }
    
    func scale(for question: Question) -> CGFloat {
        var scale: CGFloat = 0
        
        guard let index = model.questionBank.firstIndex(where: { $0.id == question.id }) else {
            return scale
        }
        
        scale = CGFloat(index) * 0.02
        
        return CGFloat(1 - scale)
    }
    
    func getOpacity(for question: Question) -> CGFloat {
        var opacityValue: CGFloat = 1
        
        guard let index = model.questionBank.firstIndex(where: { $0.id == question.id }) else {
            return opacityValue
        }
        
        if index == 0 {
            opacityValue = 1
        } else {
            opacityValue = CGFloat(index) * 0.25
        }
        
        return opacityValue
    }
}

struct QuestionsScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsScreen()
            .environmentObject(ViewModel())
    }
}


struct QuestionCardView: View {
    
    let question: Question
    @EnvironmentObject private var model: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(question.title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.02, blue: 0.37, alpha: 1)))
                
                Text("Select one of the options")
                    .font(.callout)
                    .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.02, blue: 0.37, alpha: 0.7)))
            }
            
            VStack(spacing: 16) {
                ForEach(question.options) { option in
                    DIOptionButton(option.title) {
                        print("✅ The selected option is \(option.title) for the question \(question.title)")
                        model.selectedOptions[question.id] = option
                        print("✅ The model.selectedOption has \(model.selectedOptions.count) elements which are \(model.selectedOptions)")
                        
                        model.completedQuestions.append(question)
                        
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
