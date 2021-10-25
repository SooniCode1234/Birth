//
//  StartAssessmentScreen.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import SwiftUI

struct StartAssessmentScreen: View {
    
    @State private var showQuestionsView = false
    
    @EnvironmentObject private var model: ViewModel
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.0117647061124444, green: 0.01568627543747425, blue: 0.3686274588108063, alpha: 1))
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                Image("happy-emoji")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350.0)
                
                VStack {
                    VStack(alignment: .leading, spacing: 16.0) {
                        Text("Fill out the Edinburgh Perinatal/Postnatal Depression Scale")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.02, blue: 0.37, alpha: 1)))
                        
                        Text("By answering these questions, we can help you denote the probability of you having depression")
                            .font(.callout)
                            .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0.02, blue: 0.37, alpha: 0.7)))
                    }
                    
                    Spacer()
                    
                    BIButton("Start Assessment") {
                        showQuestionsView = true
                    }
                    .padding(20)
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 20)
                .background(Color.white)
                .customCornerRadius(30, corners: [.topLeft, .topRight])
                .ignoresSafeArea(edges: .bottom)
            }
            .padding(.top, 20)
        }
        .fullScreenCover(isPresented: $showQuestionsView) {
            QuestionsScreen()
                .environmentObject(model)
        }
    }
}

struct StartAssessmentScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartAssessmentScreen()
    }
}
