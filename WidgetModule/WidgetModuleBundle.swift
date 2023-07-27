//
//  WidgetModuleBundle.swift
//  WidgetModule
//
//  Created by LUIS ALEJANDRO CORREA ROSADO on 21/07/23.
//

import WidgetKit
import SwiftUI

@main
struct WidgetModuleBundle: WidgetBundle {
    var body: some Widget {
        WidgetModule()
        WidgetModuleLiveActivity()
    }
}
