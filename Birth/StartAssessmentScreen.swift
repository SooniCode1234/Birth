//
//  StartAssessmentScreen.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import SwiftUI

struct StartAssessmentScreen: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.0117647061124444, green: 0.01568627543747425, blue: 0.3686274588108063, alpha: 1))
                .ignoresSafeArea()
            
            VStack {
                Image("happy-emoji")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350.0)
                
                Spacer()
                
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
            
                    }
                    .padding(20)
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 20)
                .background(Color.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .ignoresSafeArea(edges: .bottom)

                .padding(.top, 60)
            }
            .padding(.top, 20)
        }
    }
}

struct StartAssessmentScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartAssessmentScreen()
    }
}