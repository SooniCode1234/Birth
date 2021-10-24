//
//  RoundedCorners.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-24.
//

import SwiftUI

// From stack overflow: https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui
struct RoundedCorners: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCorners_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCorners(radius: 30, corners: [.topLeft, .topRight])
            .padding(.top, 90)
            .ignoresSafeArea(edges: .bottom)
            .cornerRadius(30, corners: [.topLeft, .topRight])
    }
}

extension View {
    func `cornerRadius`(_ radius: CGFloat, corners: UIRectCorner = .allCorners) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}
