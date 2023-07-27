//
//  MinimalView.swift
//  WidgetModuleExtension
//
//  Created by LUIS ALEJANDRO CORREA ROSADO on 26/07/23.
//

import SwiftUI

struct MinimalView: View {
    let value: Int
    var body: some View {
        clock(value: value).frame(width: 24, height: 24)
    }
    
    func clock(value: Int = 3) -> some View {
        GeometryReader { proxy in
            ZStack {
                Image("shoping_cart")
                Circle()
                    //.inset(by: proxy.size.width / 4)
                    .trim(from: 0, to: 1 /  5)
                    .stroke(value > 0 ? Constants.greenColor : Constants.grayColor, lineWidth: 2)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear, value: value)
                    
                    
                Circle()
                    //.inset(by: proxy.size.width / 4)
                    .trim(from: 0, to: 1 /  5)
                    .stroke(value > 1 ? Constants.greenColor : Constants.grayColor, lineWidth: 2)
                    .rotationEffect(.degrees(0))
                    .animation(.linear, value: value)
                
                Circle()
                    //.inset(by: proxy.size.width / 4)
                    .trim(from: 0, to: 1 /  5)
                    .stroke(value > 2 ? Constants.greenColor : Constants.grayColor, lineWidth: 2)
                    .rotationEffect(.degrees(90))
                    .animation(.linear, value: value)
                
                Circle()
                    //.inset(by: proxy.size.width / 4)
                    .trim(from: 0, to: 1 /  5)
                    .stroke(value > 3 ? Constants.greenColor : Constants.grayColor, lineWidth: 2)
                    .rotationEffect(.degrees(180))
                    .animation(.linear, value: value)
                    
            }
        }
    }
}

struct MinimalView_Previews: PreviewProvider {
    static var previews: some View {
        MinimalView(value: 3)
    }
}

