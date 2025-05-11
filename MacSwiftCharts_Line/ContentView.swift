//
//  ContentView.swift
//  MacSwiftCharts_Line
//
//  Created by rabbit on 2025/05/11.
//

import SwiftUI
import Charts


// MARK: - Swift Chart View

struct ChartData: Identifiable {
    var id: String { category }
    var category: String
    var valueSet: [ValueSet]
}

struct ValueSet: Identifiable {
    var id = UUID()
    let date: Date
    let value: Int
}

struct ContentView: View {

    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        Chart {
            ForEach(viewModel.data) { category in
                ForEach(category.valueSet) { valueSet in
                    LineMark(
                        x: .value("date", valueSet.date, unit: .day),
                        y: .value("value", valueSet.value)
                    )
                    .lineStyle(.init(lineWidth: 1))

                    PointMark(
                        x: .value("date", valueSet.date, unit: .day),
                        y: .value("value", valueSet.value)
                    )
                    .symbol(by: .value("category", category.category))
                }
                .foregroundStyle(by: .value("category", category.category))
            }
        }
        .chartForegroundStyleScale(["apple": .pink, "banana": .yellow])
        .chartSymbolScale(["apple": .diamond, "banana": .circle])
        .chartXAxis {
            AxisMarks(values: .stride(by: .day, count: 1)) {
                AxisGridLine()
                AxisTick()
                AxisValueLabel()
            }
        }
        .chartLegend(
            position: .top,
            alignment: .leading,
            spacing: 10
        )
        .chartXAxisLabel(position: .bottom, alignment: .center, spacing: 10) {
            Text("Date").font(.title3)
        }
        .chartYAxisLabel(position: .trailing, alignment: .center, spacing: 10) {
            Text("Count").font(.title3)
        }




//        .frame(maxWidth: 400, minHeight: 400)   // for design on Xcode Preview
    }
}

class ContentViewModel: ObservableObject {

    @Published var data: [ChartData] = []

    init(_ chartData: [ChartData] = []) {
        self.data = chartData
    }
}




// MARK: - Previews

#Preview("Swift Charts - Line on Mac") {
    ContentView(viewModel: ContentViewModel(
        [
            .init(category: "apple", valueSet: [
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 1))!, value: 70),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 2))!, value: 80),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 3))!, value: 80),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 4))!, value: 85),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 5))!, value: 90),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 6))!, value: 80),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 7))!, value: 80),
            ]),
            .init(category: "banana", valueSet: [
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 1))!, value: 100),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 2))!, value: 110),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 3))!, value: 120),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 4))!, value: 115),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 5))!, value: 110),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 6))!, value: 100),
                .init(date: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 7))!, value: 120),
            ]),
        ]
    ))
}

