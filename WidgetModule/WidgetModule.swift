//
//  WidgetModule.swift
//  WidgetModule
//
//  Created by LUIS ALEJANDRO CORREA ROSADO on 21/07/23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        entries.append(SimpleEntry(date: Date(), configuration: configuration))
        entries.append(SimpleEntry(date: Date().addingTimeInterval(5), configuration: configuration))
        entries.append(SimpleEntry(date: Date().addingTimeInterval(10), configuration: configuration))
        entries.append(SimpleEntry(date: Date().addingTimeInterval(15), configuration: configuration))
        

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct WidgetModuleEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

struct WidgetModule: Widget {
    let kind: String = "WidgetModule"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetModuleEntryView(entry: entry)
        }
        .configurationDisplayName("Widget NTT DATA")
        .description("Ejemplo de widget por NTT DATA")
    }
}

struct WidgetModule_Previews: PreviewProvider {
    static var previews: some View {
        WidgetModuleEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
