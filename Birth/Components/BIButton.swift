//
//  BIButton.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import SwiftUI

struct BIButton: View {
        
    let title: String
    let action: () -> Void
    
    init(_ title: String, action: @escaping () -> Void) {
        self.title  = title
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.vertical, 18)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .shadow(color: Color("AccentColor").opacity(0.15), radius: 20, x: 0, y: 10)
    }
}

struct BIButton_Previews: PreviewProvider {
    static var previews: some View {
        BIButton("Start Assessment") { }
            .padding(20)
    }
}
