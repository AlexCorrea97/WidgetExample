//
//  WidgetTrackingAttributes.swift
//  WidgetExample
//
//  Created by LUIS ALEJANDRO CORREA ROSADO on 21/07/23.
//

import Foundation
import ActivityKit

struct WidgetTrackingAttributes : ActivityAttributes {
    public typealias WidgetTrackingStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var startTime: Date
    }
}
