//
//  ProgressCircle.swift
//  WidgetExample
//
//  Created by LUIS ALEJANDRO CORREA ROSADO on 21/07/23.
//

import SwiftUI

struct ProgressCircle: View {
    let value: Double
    let maxValue: Double
    var body: some View {
        ZStack {
            Circle()
                            .stroke(lineWidth: 10)
                            .foregroundColor(Color.black)
            Circle()
                .trim(from: 0, to: CGFloat(self.value / self.maxValue))
                .stroke(style: StrokeStyle())
                .foregroundColor(Color.black)
                .rotationEffect(Angle(degrees: -90))
                .animation(.easeIn)
        }
    }
}

struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircle(value: 2, maxValue: 4)
    }
}
