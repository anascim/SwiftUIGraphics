//
//  GraphView.swift
//  SwiftUI_Graphics
//
//  Created by Paula Leite on 12/06/20.
//  Copyright © 2020 Luiza Fattori. All rights reserved.
//

import SwiftUI

public struct AxisComponent: Hashable {
    var subtitle: String
    var max: Double
}

public struct GraphElement: Hashable {
    var subtitle: String
    var values: [Double]
    var color: Color
}

extension GeometryProxy {
    func center() -> CGPoint {
        return CGPoint(x: self.frame(in: .global).midX, y: self.frame(in: .global).midY)
    }
}
