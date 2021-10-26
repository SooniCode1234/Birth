//
//  QuestionsScreen.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import SwiftUI

/// Screen that shows the user all the questions
struct QuestionsScreen: View {
    /// Reading the ViewModel as a EnvironmentObject in the entire App
    @EnvironmentObject private var model: ViewModel
    /// State variable that controls whether or not to show the questions based weather or not the user is finished with the questions
    @State private var showResultsScreen = false
    /// State variable that controls the progress bar width amount
    @State private var progress: CGFloat = 0
    /// State variable that controls whether or not to animate the blob shape
    @State private var animateBlobs = false
    
    var body: some View {
        ZStack {
            // Background Color
            Color(#colorLiteral(red: 0.0117647061124444, green: 0.01568627543747425, blue: 0.3686274588108063, alpha: 1))
                .ignoresSafeArea()

            // Blob Container
            ZStack {
                BlobShape()
                    .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.0470588244497776, green: 0.23137255012989044, blue: 0.6666666865348816, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.0235294122248888, green: 0.09803921729326248, blue: 0.5764706134796143, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: -0.0010022369043808377, y: 2.9608462903674138e-9),
                        endPoint: UnitPoint(x: 1.00044921785963, y: 0.9989486942170716)))
                    .blur(radius: 4)
                    .frame(width: 124.65, height: 141)
                    .rotationEffect(.degrees(100))
                    .rotationEffect(.degrees(170))
                    .rotationEffect(.degrees(animateBlobs ? 360 : 0))
                    .offset(x: -120)
                
                BlobShape()
                    .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.0470588244497776, green: 0.23137255012989044, blue: 0.6666666865348816, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.0235294122248888, green: 0.09803921729326248, blue: 0.5764706134796143, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: -0.0010022369043808377, y: 2.9608462903674138e-9),
                        endPoint: UnitPoint(x: 1.00044921785963, y: 0.9989486942170716)))
                    .blur(radius: 4)
                    .frame(width: 189.14, height: 226.933)
                    .rotationEffect(.degrees(170))
                    .rotationEffect(.degrees(animateBlobs ? 360 : 0))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .offset(x: 50, y: 130)
            .ignoresSafeArea(edges: .bottom)
            .onAppear {
                withAnimation(.linear(duration: 12).repeatForever(autoreverses: false)) {
                    animateBlobs = true
                }
            }
            
            // Progression indicator stack
            VStack(spacing: 44) {
                VStack(alignment: .leading, spacing: 16.0) {
                    Text("Question \(model.completedQuestions.count) / 10")
                        .font(.title3)
                        .foregroundColor(Color(.white).opacity(0.7))

                    GeometryReader { reader in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color(red: 0.008, green: 0.14, blue: 0.453))
                                .frame(width: reader.size.width, height: 24)
                            
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color.accentColor)
                            // Logic for progress bar width https://www.simpleswiftguide.com/how-to-build-linear-progress-bar-in-swiftui/
                                .frame(width: min(progress * reader.size.width, reader.size.width), height: 24)
                                .animation(.linear, value: progress)
                        }
                    }
                    .frame(height: 24)
                }

                // Question card z-axis stack
                ZStack(alignment: .top) {
                    // Looping through the question bank and showing a card for each question
                    ForEach(model.questionBank) { question in
                        QuestionCardView(question: question, progress: $progress)
                            // Applying modifiers to get desired animation
                            .zIndex(isTopCard(for: question) ? 1 : 0)
                            .offset(y: isTopCard(for: question) ? 0 : getOffset(for: question))
                            .opacity(isTopCard(for: question) ? 1 : 0.2)
                            .scaleEffect(isTopCard(for: question) ? 1 : scale(for: question))
                            .transition(.asymmetric(insertion: .identity,
                                                    removal: .move(edge: .trailing)
                                                             .combined(with: .move(edge: .bottom))))
                    }
                }
                
                // Pushes everything up
                Spacer()
            }
            .padding([.horizontal, .top], 20)
            // Tracks the changes of the completedQuestions
            .onChange(of: model.completedQuestions) { completedQuestions in
                // Ensures that the user is completely finished answering the questions before moving on to the next screen
                // Every time the user answers a question, it gets added to the array and here we are checking if the array is full (since the total number of questions is 10, we are checking if the user answered 10 questions)
                guard completedQuestions.count == 10 else { return }
                
                // Waiting a couple of milliseconds before presenting the next screen so that it's not abrupt
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    showResultsScreen = true
                }
            }
            // Showing the Results Screen as a Popup
            .fullScreenCover(isPresented: $showResultsScreen) {
                ResultsScreen()
                // Injecting the ViewModel as a EnvironmentObject to the Results Screen
                    .environmentObject(model)
            }
        }
    }
    
    /// Function that checks whether the question passed in is the top card
    /// - Parameter question: The question that the loop is currently on
    /// - Returns: Bool
    func isTopCard(for question: Question) -> Bool {
        guard let index = model.questionBank.firstIndex(where: { $0.id == question.id }) else {
            return false
        }
        
        return index == 0
    }
    
    // To get the deck looking right, I read https://www.swiftcompiled.com/swiftui-cards/ and used the functions
    
    /// Function that determines how much the card show offset down by based on the index
    /// - Parameter question: The question that the loop is currently on
    /// - Returns: A number to move down by
    func getOffset(for question: Question) -> CGFloat {
        var offset: CGFloat = 0
        
        guard let index = model.questionBank.firstIndex(where: { $0.id == question.id }) else {
            return offset
        }
        
        offset = CGFloat(index) * 10
        
        
        return offset
    }
    
    /// Function that determines how much the card should be scaled down by based on the index
    /// - Parameter question: The question that the loop is currently on
    /// - Returns: A number to scale down by
    func scale(for question: Question) -> CGFloat {
        var scale: CGFloat = 0.001
        
        guard let index = model.questionBank.firstIndex(where: { $0.id == question.id }) else {
            return scale
        }
        
        scale = CGFloat(index) * 0.02
        
        return CGFloat(1 - scale)
    }

    /// Function that determines how much the card should be transparent based on the index
    /// - Parameter question: The question that the loop is currently on
    /// - Returns: A number to turn down the opacity by
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
