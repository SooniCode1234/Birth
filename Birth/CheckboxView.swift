//
//  CheckboxView.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-25.
//

import SwiftUI

struct CheckboxView: View {
    
    let checkmarkPressed: Bool
    
    var body: some View {
        VStack(spacing: 32) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .scale(checkmarkPressed ? 1 : 0.0, anchor: .center)
                    .fill(
                        checkmarkPressed ? Color(#colorLiteral(red: 0.03802084922790527, green: 0.5132813453674316, blue: 0.6083333492279053, alpha: 0.699999988079071)) : Color.clear)
                    .frame(width: 30, height: 30)
                    .animation(.easeIn, value: checkmarkPressed)
                
                Image(systemName: "checkmark")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Color.white)
                    .scaleEffect(checkmarkPressed ? 1 : 0, anchor: .center)
                    .opacity(checkmarkPressed ? 1 : 0)
                    .transition(.asymmetric(insertion: .scale.animation(.spring(response: 0.2, dampingFraction: 0.3).delay(0.3)), removal: .scale.animation(.spring(response: 0.4, dampingFraction: 0.5))))
            }
        }
    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView(checkmarkPressed: true)
    }
}
