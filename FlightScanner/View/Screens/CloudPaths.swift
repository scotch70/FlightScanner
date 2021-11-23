//
//  CloudPaths.swift
//  FlightScanner
//
//  Created by Ian Donker on 18/11/2021.
//

import SwiftUI

struct CloudPaths: View {
    let universalSize = UIScreen.main.bounds.width
    @State var flag: Bool
    var body: some View {
        if #available(iOS 15.0, *) {
            ZStack(alignment: .top) {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 100, height: 100)
                    .padding()
                
                CloudPath()
                    .stroke(.blue, lineWidth: 10)
                
                CloudPathTwo()
                    .stroke(.blue, lineWidth: 10)
                
                CloudPathThree()
                    .stroke(.blue, lineWidth: 10)
                
                Image(systemName: "cloud.fill").resizable().foregroundColor(Color.white)
                    .frame(width: 30, height: 30).offset(x: -17, y: -17)
                    .modifier(FollowEffectTwo(pct: self.flag ? 1 : 0, path: CloudPath.createCloudPath(in: CGRect(x: 0, y: 0, width: universalSize, height: 300)), rotate: false))
                    .onAppear {
                        withAnimation(Animation.linear(duration: 10).delay(10).repeatForever( autoreverses: false)) {
                            self.flag.toggle()
                        }
                    }
                
                Image(systemName: "cloud.fill").resizable().foregroundColor(Color.white)
                    .frame(width: 30, height: 30).offset(x: -17, y: -17)
                    .modifier(FollowEffectTwo(pct: self.flag ? 1 : 0, path: CloudPathTwo.createCloudPath(in: CGRect(x: 0, y: 0, width: universalSize, height: 300)), rotate: false))
                    .onAppear {
                        withAnimation(Animation.linear(duration: 15).delay(7).repeatForever( autoreverses: false)) {
                            self.flag.toggle()
                        }
                    }
                
                Image(systemName: "cloud.fill").resizable().foregroundColor(Color.white)
                    .frame(width: 30, height: 30).offset(x: -17, y: -17)
                    .modifier(FollowEffectTwo(pct: self.flag ? 1 : 0, path: CloudPathThree.createCloudPath(in: CGRect(x: 0, y: 0, width: universalSize, height: 300)), rotate: false))
                    .onAppear {
                        withAnimation(Animation.linear(duration: 12).delay(18).repeatForever( autoreverses: false)) {
                            self.flag.toggle()
                        }
                    }
            }
            .background(Color.cyan)
        } else {
            
            Color.blue
        }
    }
}

struct CloudPaths_Previews: PreviewProvider {
    static var previews: some View {
        CloudPaths(flag: false)
    }
}

struct FollowEffectTwo: GeometryEffect {
    var pct: CGFloat = 0
    let path: Path
    var rotate = false

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

struct CloudPath: Shape {
    func path(in rect: CGRect) -> Path {
        return CloudPath.createCloudPath(in: rect)
    }

    static func createCloudPath(in rect: CGRect) -> Path {
        
        var path = Path()
        path.move(to: CGPoint(x: 500, y: 500))
        path.addLine(to: CGPoint(x: 450, y: 450))
        path.addLine(to: CGPoint(x: 400, y: 500))
        path.addLine(to: CGPoint(x: 350, y: 450))
        path.addLine(to: CGPoint(x: 300, y: 500))
        path.addLine(to: CGPoint(x: 250, y: 450))
        path.addLine(to: CGPoint(x: 200, y: 500))
        path.addLine(to: CGPoint(x: 150, y: 450))
        path.addLine(to: CGPoint(x: 100, y: 500))
        path.addLine(to: CGPoint(x: 50, y: 450))
        path.addLine(to: CGPoint(x: 0, y: 500))


        return path
    }
}

struct CloudPathTwo: Shape {
    func path(in rect: CGRect) -> Path {
        return CloudPathTwo.createCloudPath(in: rect)
    }

    static func createCloudPath(in rect: CGRect) -> Path {
        
        var path = Path()
        path.move(to: CGPoint(x: 500, y: 400))
        path.addLine(to: CGPoint(x: 450, y: 450))
        path.addLine(to: CGPoint(x: 400, y: 400))
        path.addLine(to: CGPoint(x: 350, y: 450))
        path.addLine(to: CGPoint(x: 300, y: 400))
        path.addLine(to: CGPoint(x: 250, y: 450))
        path.addLine(to: CGPoint(x: 200, y: 400))
        path.addLine(to: CGPoint(x: 150, y: 450))
        path.addLine(to: CGPoint(x: 100, y: 400))
        path.addLine(to: CGPoint(x: 50, y: 450))
        path.addLine(to: CGPoint(x: 0, y: 400))


        return path
    }
}

struct CloudPathThree: Shape {
    func path(in rect: CGRect) -> Path {
        return CloudPathThree.createCloudPath(in: rect)
    }

    static func createCloudPath(in rect: CGRect) -> Path {
        
        var path = Path()
        path.move(to: CGPoint(x: 500, y: 475))
        path.addLine(to: CGPoint(x: 450, y: 450))
        path.addLine(to: CGPoint(x: 400, y: 475))
        path.addLine(to: CGPoint(x: 350, y: 450))
        path.addLine(to: CGPoint(x: 300, y: 475))
        path.addLine(to: CGPoint(x: 250, y: 450))
        path.addLine(to: CGPoint(x: 200, y: 475))
        path.addLine(to: CGPoint(x: 150, y: 450))
        path.addLine(to: CGPoint(x: 100, y: 475))
        path.addLine(to: CGPoint(x: 50, y: 450))
        path.addLine(to: CGPoint(x: 0, y: 475))


        return path
    }
}
