//
//  BlobShape.swift
//  Birth
//
//  Created by Sooni Mohammed on 2021-10-26.
//

import SwiftUI

// To get this complex shape, I just copied the svg code from Figma and pasted it in https://quassummanus.github.io/SVG-to-SwiftUI/ to get the code

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5646758378*width, y: 0.0000403986*height))
        path.addCurve(to: CGPoint(x: 0.8634568363*width, y: 0.1336263431*height), control1: CGPoint(x: 0.6805070575*width, y: -0.0018336983*height), control2: CGPoint(x: 0.7860628701*width, y: 0.0617713586*height))
        path.addCurve(to: CGPoint(x: 0.961881248*width, y: 0.3688183437*height), control1: CGPoint(x: 0.9316736524*width, y: 0.1969609707*height), control2: CGPoint(x: 0.9375902667*width, y: 0.2861490757*height))
        path.addCurve(to: CGPoint(x: 0.9987102219*width, y: 0.5939328163*height), control1: CGPoint(x: 0.9840374376*width, y: 0.4442222976*height), control2: CGPoint(x: 1.0055456517*width, y: 0.5165097775*height))
        path.addCurve(to: CGPoint(x: 0.9167274586*width, y: 0.8802630208*height), control1: CGPoint(x: 0.9898538314*width, y: 0.6942467228*height), control2: CGPoint(x: 0.9970616038*width, y: 0.8052028979*height))
        path.addCurve(to: CGPoint(x: 0.5646758378*width, y: 0.9994723888*height), control1: CGPoint(x: 0.8302935348*width, y: 0.9610224601*height), control2: CGPoint(x: 0.6943942926*width, y: 0.9947434345*height))
        path.addCurve(to: CGPoint(x: 0.1895150661*width, y: 0.9067739352*height), control1: CGPoint(x: 0.4310985857*width, y: 1.0043420177*height), control2: CGPoint(x: 0.2946086039*width, y: 0.9756687626*height))
        path.addCurve(to: CGPoint(x: 0.0000192668*width, y: 0.6293076425*height), control1: CGPoint(x: 0.0866364921*width, y: 0.8393311433*height), control2: CGPoint(x: 0.0019879688*width, y: 0.7383884669*height))
        path.addCurve(to: CGPoint(x: 0.1798665821*width, y: 0.3721754133*height), control1: CGPoint(x: -0.0018160337*width, y: 0.5276182682*height), control2: CGPoint(x: 0.1279570116*width, y: 0.4642140271*height))
        path.addCurve(to: CGPoint(x: 0.2742053402*width, y: 0.1431601642*height), control1: CGPoint(x: 0.2220969026*width, y: 0.2972986618*height), control2: CGPoint(x: 0.209398844*width, y: 0.2058321626*height))
        path.addCurve(to: CGPoint(x: 0.5646758378*width, y: 0.0000403986*height), control1: CGPoint(x: 0.3494781814*width, y: 0.0703665378*height), control2: CGPoint(x: 0.4493999362*width, y: 0.0019055109*height))
        path.closeSubpath()
        return path
    }
}

struct BlobShape_Previews: PreviewProvider {
    static var previews: some View {
        BlobShape()
            .fill(LinearGradient(
                gradient: Gradient(stops: [
            .init(color: Color(#colorLiteral(red: 0.0470588244497776, green: 0.23137255012989044, blue: 0.6666666865348816, alpha: 1)), location: 0),
            .init(color: Color(#colorLiteral(red: 0.0235294122248888, green: 0.09803921729326248, blue: 0.5764706134796143, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: -0.0010022369043808377, y: 2.9608462903674138e-9),
                endPoint: UnitPoint(x: 1.00044921785963, y: 0.9989486942170716)))
            .frame(width: 189.14, height: 226.933)
            .rotationEffect(.degrees(170))
    }
}
