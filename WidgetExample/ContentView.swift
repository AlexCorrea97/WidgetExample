//
//  ContentView.swift
//  WidgetExample
//
//  Created by LUIS ALEJANDRO CORREA ROSADO on 21/07/23.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var isTrackingTime = false
    @State private var startTime: Date? = nil
    @State private var activity: Activity<WidgetTrackingAttributes>? = nil
    var body: some View {
        VStack {
            Button(action: {
                let attributes = WidgetTrackingAttributes()
                let state = WidgetTrackingAttributes.ContentState(startTime: .now)
                activity = try? Activity<WidgetTrackingAttributes>.request(attributes: attributes, contentState: state)
            }, label: {
                Text("Ejemplo de widget")
                    .font(.system(size: 24))
                    .fontWeight(Font.Weight.bold)
                    .foregroundColor(Color.white)
                    .padding()
            })
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.blue)
            .cornerRadius(25)
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
