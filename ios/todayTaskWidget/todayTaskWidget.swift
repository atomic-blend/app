//
//  today_task_widget.swift
//  today-task-widget
//
//  Created by Brandon Guigo on 26/06/2025.
//

import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> TodayTaskWidgetData {
        TodayTaskWidgetData(date: Date(), isSubscribed: false, tasks: [])
    }

    func getSnapshot(in context: Context, completion: @escaping (TodayTaskWidgetData) -> Void) {
        let prefs = UserDefaults(suiteName: "group.atomicblend.tasks")
        let isSubscribed = prefs?.bool(forKey: "isSubscribed") ?? false
        let entry = TodayTaskWidgetData(date: Date(), isSubscribed: isSubscribed, tasks: [])
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        getSnapshot(in: context) { (entry) in
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
    }

    //    func relevances() async -> WidgetRelevances<Void> {
    //        // Generate a list containing the contexts this widget is relevant in.
    //    }
}

struct TodayTaskWidgetData: TimelineEntry {
    let date: Date
    let isSubscribed: Bool
    let tasks: [TaskEntity]
}

struct TaskEntity: Decodable {
    let id: String?
    let title: String
    let completed: Bool?
}

struct today_task_widgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Header row
            HStack {
                Text("Aujourd'hui")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Text(entry.date, style: .time)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            // Tasks rows
            if entry.tasks.isEmpty {
                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                    Text("Aucune tâche")
                        .font(.body)
                    Spacer()
                }
            } else {
                ForEach(entry.tasks.prefix(3), id: \.id) { task in
                    HStack(alignment: .top, spacing: 8) {
                        Image(
                            systemName: task.completed == true ? "checkmark.circle.fill" : "circle"
                        )
                        .foregroundColor(task.completed == true ? .green : .gray)
                        .frame(width: 16, height: 16)

                        Text(task.title)
                            .font(.body)
                            .lineLimit(1)
                            .strikethrough(task.completed == true)
                            .foregroundColor(task.completed == true ? .secondary : .primary)

                        Spacer()
                    }
                }

                // Show remaining tasks count if more than 3
                if entry.tasks.count > 3 {
                    HStack {
                        Text("+ \(entry.tasks.count - 3) autres tâches")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct today_task_widget: Widget {
    let kind: String = "today_task_widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                today_task_widgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                today_task_widgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    today_task_widget()
} timeline: {
    TodayTaskWidgetData(date: .now, isSubscribed: false, tasks: [])
    TodayTaskWidgetData(
        date: .now, isSubscribed: true,
        tasks: [TaskEntity(id: "1", title: "Task 1", completed: false)])
}
