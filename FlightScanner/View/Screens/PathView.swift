//
//  PathView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 09/11/2021.
//

import SwiftUI

struct PathView: View {
    let universalSize = UIScreen.main.bounds.width
    @State var flag: Bool
    var flightTime: String
    var arrivalAirport: String
    var departureAirport: String
    
    var flightTimeDouble: Double {
        let flyTime = Double(flightTime)
        return flyTime ?? 0.0
    }
       
    var actualFlightTime: Double {
        let oneHour = 3600.0
        let flyTime = flightTimeDouble
        let sum = oneHour * flyTime
        return sum
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Draw the Infinity Shape
            InfinityShape().stroke(Color.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [7, 7], dashPhase: 0))
                .foregroundColor(.blue)
                .overlay(
                    VStack {
                        Text("")
                    HStack(spacing: 50) {
                        Text(departureAirport)
                        Text("\(flightTime)h")
                            .foregroundColor(.blue)
                        Text(arrivalAirport)
                    }
                    })
                    
                .frame(width: universalSize, height: 300)
            
            
            
            //                 Animate movement of Image
            Image(systemName: "airplane").resizable().foregroundColor(Color.blue)
                .frame(width: 30, height: 30).offset(x: -17, y: -17)
                .modifier(FollowEffect(pct: self.flag ? 1 : 0, path: InfinityShape.createInfinityPath(in: CGRect(x: 0, y: 0, width: universalSize, height: 300)), rotate: true))
                .onAppear {
                    withAnimation(Animation.linear(duration: actualFlightTime).repeatCount(1,autoreverses: false)) {
                        self.flag.toggle()
                    }
                }
            
        }.frame(alignment: .topLeading)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView(flag: false, flightTime: "2.15", arrivalAirport: "Barcelona", departureAirport: "Amsterdam")
    }
}



struct FollowEffect: GeometryEffect {
    var pct: CGFloat = 0
    let path: Path
    var rotate = true

    var animatableData: CGFloat {
        get { return pct }
        set { pct = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {

        if !rotate {
            let pt = percentPoint(pct)

            return ProjectionTransform(CGAffineTransform(translationX: pt.x, y: pt.y))
        } else {
            // Calculate rotation angle, by calculating an imaginary line between two points
            // in the path: the current position (1) and a point very close behind in the path (2).
            let pt1 = percentPoint(pct)
            let pt2 = percentPoint(pct - 0.01)

            let a = pt2.x - pt1.x
            let b = pt2.y - pt1.y

            let angle = a < 0 ? atan(Double(b / a)) : atan(Double(b / a)) - Double.pi

            let transform = CGAffineTransform(translationX: pt1.x, y: pt1.y).rotated(by: CGFloat(angle))

            return ProjectionTransform(transform)
        }
    }

    func percentPoint(_ percent: CGFloat) -> CGPoint {

        let pct = percent > 1 ? 0 : (percent < 0 ? 1 : percent)

        let f = pct > 0.999 ? CGFloat(1-0.001) : pct
        let t = pct > 0.999 ? CGFloat(1) : pct + 0.001
        let tp = path.trimmedPath(from: f, to: t)

        return CGPoint(x: tp.boundingRect.midX, y: tp.boundingRect.midY)
    }
}
    

struct InfinityShape: Shape {
    func path(in rect: CGRect) -> Path {
        return InfinityShape.createInfinityPath(in: rect)
    }

    static func createInfinityPath(in rect: CGRect) -> Path {
        let height = rect.size.height
        let width = rect.size.width
        let heightFactor = height/2
        let widthFactor = width/2

        var path = Path()
        path.move(to: CGPoint(x: 0, y: heightFactor))
        path.addLine(to: CGPoint(x: widthFactor * (0.10), y: heightFactor))
        path.addCurve(to: CGPoint(x: width - 10, y: heightFactor), control1: CGPoint(x: widthFactor * (0.20), y: 150), control2: CGPoint(x: widthFactor * (0.80), y: -10))
        path.addLine(to: CGPoint(x: width + 20, y: heightFactor))


        return path
    }
}
