//
//  ViewController.swift
//  MacSwiftCharts_Line
//
//  Created by rabbit on 2025/05/11.
//

import Cocoa
import SwiftUI


class ViewController: NSViewController {

    private var contentView: NSHostingView<ContentView>!
    @State private var contentViewModel = ContentViewModel()

    override func viewDidAppear() {
        self.view.window!.center()
        self.view.window?.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
            "Set TARGETS > General > Identity > Display Name"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        contentViewModel.data = [
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

        contentView = NSHostingView(rootView: ContentView(viewModel: contentViewModel))
        self.view.addSubview(contentView)
        contentView.frame = .init(origin: .init(x: 0, y: 0), size: .init(width: 500, height: 400))
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: contentView.superview!.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: contentView.superview!.centerYAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: contentView.superview!.widthAnchor, constant: -100).isActive = true
        contentView.heightAnchor.constraint(equalTo: contentView.superview!.heightAnchor, constant: -100).isActive = true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

