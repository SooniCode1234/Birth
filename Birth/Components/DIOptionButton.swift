//
//  DIOptionButton.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import SwiftUI

struct DIOptionButton: View {
    let title: String
    @State private var isSelected: Bool = false
    let action: () -> Void
    
    @State private var trimValue: CGFloat = 0
    
    
    init(_ title: String, action: @escaping () -> Void) {
        self.title  = title
        self.action = action
    }
    
    var body: some View {
        HStack {
            CheckboxView(checkmarkPressed: isSelected)

            Text(title)
                .font(.headline)
                .foregroundColor(isSelected ? .white : .accentColor)
                .offset(x: !isSelected ? -25 : 0)
                .layoutPriority(4)

            if isSelected {
                Spacer()
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 18)
        .frame(maxWidth: .infinity)
        .background(isSelected ? Color.accentColor : Color.white)
        .cornerRadius(15)
        .onTapGesture {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.8)) {
                isSelected.toggle()
            }
            
            action()
        }
        .overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color.accentColor, lineWidth: 1))
        .shadow(color: Color("AccentColor").opacity(isSelected ? 0.15 : 0), radius: 20, x: 0, y: 10)
    }
}

struct DIOptionButton_Previews: PreviewProvider {
    
    struct Preview: View {
        @State private var tapped = false
        
        var body: some View {
            DIOptionButton("Not quite so much now") {  }
            .padding()
        }
    }
    
    static var previews: some View {
        Preview()
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
