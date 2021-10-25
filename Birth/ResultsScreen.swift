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

                    Text("Probable Depression")
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
                        
                        Text("Diagnostic assessment and treatment by Primary Care Physician and/or specialist.")
                            .font(.callout)
                            .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.02, blue: 0.37, alpha: 0.7)))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .layoutPriority(2)
                    
                    Spacer()
                    
                    BIButton("Redo Assessment") {
                        showQuestionsScreen = true
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
