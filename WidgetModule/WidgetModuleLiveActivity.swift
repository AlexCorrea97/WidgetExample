//
//  WidgetModuleLiveActivity.swift
//  WidgetModule
//
//  Created by LUIS ALEJANDRO CORREA ROSADO on 21/07/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetModuleAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }
    
    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetModuleLiveActivity: Widget {
    func clock(_ value: Double) -> some View {
        GeometryReader { proxy in
            ZStack {
                Circle()
                    .inset(by: proxy.size.width / 4)
                    .trim(from: 0, to: value /  4)
                    .stroke(Color(hex: 0x4FAE7B), lineWidth: 2)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear, value: value)
            }
        }
    }
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetTrackingAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    
                    ExpandedView(style: .leading)
                    
                }
                DynamicIslandExpandedRegion(.trailing) {
                    //Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    ExpandedView(style: .bottom)
                        //.frame(maxWidth: .infinity, maxHeight: .infinity)
                    // more content
                }
            } compactLeading: {
                HStack{
                    Image("image_icon")
                        .resizable()
                        .scaledToFit()
                    
                }
            } compactTrailing: {
                HStack{
                    Text("3/4")
                    MinimalView(value: 3)
                }
            } minimal: {
                MinimalView(value: 3)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct WidgetModuleLiveActivity_Previews: PreviewProvider {
    static let attributes = WidgetTrackingAttributes()
    static let contentState = WidgetTrackingAttributes.ContentState(startTime: .now)
    
    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}
