//
//  SBDrawing.swift
//  SwiftUI_Graphics
//
//  Created by Alex Nascimento on 12/06/20.
//  Copyright © 2020 Luiza Fattori. All rights reserved.
//

import SwiftUI

struct SBDrawing: View {
    
    @State var colors: [Color] = [Color.yellow, Color(UIColor(hue: 0, saturation: 1, brightness: 1, alpha: 0.4)), Color(UIColor(hue: 0.9, saturation: 1, brightness: 1, alpha: 1)), Color(UIColor(hue: 0.8, saturation: 1, brightness: 1, alpha: 0.4))]
    @State var colors2: [Color] = [Color.blue, Color(UIColor(hue: 0.2, saturation: 1, brightness: 1, alpha: 0.4)), Color(UIColor(hue: 0.4, saturation: 1, brightness: 1, alpha: 0.4)), Color(UIColor(hue: 0.3, saturation: 1, brightness: 1, alpha: 0.4))]
    @State var innerRadius: CGFloat = 10
    @State var outerWidth: CGFloat = 20
    @State var innerWidth: CGFloat = 60
    var innerPathRadius: CGFloat {
        self.innerRadius + self.innerWidth/2
    }
    var outerPathRadius: CGFloat {
        self.innerRadius + self.innerWidth + self.outerWidth/2
    }
    
    var body: some View {
        let root = SBData<Int>(name: "root")

        let documents = SBData<Int>(name: "Documents")
        let xcode = SBData<Int>(name: "Xcode", value: 10)
        documents.addChild(xcode)

        let desktop = SBData<Int>(name: "Desktop")
        let printScreens = SBData<Int>(name: "Print Screens", value: 5)
        desktop.addChild(printScreens)
        
        let downloads = SBData<Int>(name: "Downloads", value: 3)
        let nudes = SBData<Int>(name: "MyNudes", value: 16)
        let iceCreamPhotos = SBData<Int>(name: "IceCreamPhotos", value: 5)
        let homework = SBData<Int>(name: "Homework", value: 3)
        downloads.addChildren([nudes, iceCreamPhotos, homework])

        root.addChildren([documents, desktop, downloads])

        let manager = SBDataManager<Int>(root: root)
        
        return GeometryReader { geometry in
            ForEach<ClosedRange<Int>, Int, SegmentView>(0...manager.currentRoot.children.count-1, id: \.self) { i in
                let (start, end) = manager.currentRoot.getPercentages(for: manager.currentRoot.children[i])
                return SegmentView(frameSize: geometry.size, pathRadius: 50, startPct: start, endPct: end, lineWidth: 40, color: self.colors[i%self.colors.count])
            }
        }
    }
}

struct SegmentView: View {
    
    @State var frameSize: CGSize
    @State var pathRadius: CGFloat
    @State var startPct: CGFloat
    @State var endPct: CGFloat
    @State var lineWidth: CGFloat
    @State var color: Color
    
    var body: some View {
        Path { path in
            let center = CGPoint(frameSize.width/2,
                                 frameSize.height/2)
            path.addArc(center: center, radius: self.pathRadius, startAngle: .pct(self.startPct), endAngle: .pct(self.endPct), clockwise: false)
        }
        .stroke(self.color, lineWidth: self.lineWidth)
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        SBDrawing(innerRadius: 40, innerWidth: 120)
            .previewLayout(.fixed(width: 400, height: 400))
    }
}

extension Angle {
    
    static func pct(_ pct: CGFloat) -> Angle {
        // 0 -> -pi/2 ou 3pi/2 ... 0
        // 0.25 -> 0           ... -pi/2
        // 0.5 -> pi/2         ... pi
        // 1 -> -pi/2 ou 3pi/2 ... 2pi
        let rad = pct * .pi * 2 - .pi/2
        return self.radians(Double(rad))
    }
}



extension CGPoint {
    
    init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
}

extension CGPoint: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = CGFloat
    
    public init(arrayLiteral elements: CGFloat...) {
        guard elements.count == 2 else {
            fatalError("CGPoint array with more than 2 elemnts")
        }
        self.init(elements[0], elements[1])
    }
    
}
