//
//  GroupedPageView.swift
//  JamPager
//
//  Created by Antonio Favata on 20/02/2021.
//

import SwiftUI

protocol PageGroup {
    associatedtype PageCollection: Collection
    var pages: PageCollection { get }
}

struct GroupedPageView<Source: Sequence, Content: View, ButtonLabel: View>: View where Source.Element: PageGroup {
    @Environment(\.colorScheme) var colorScheme

    typealias Page = Source.Element.PageCollection.Element
    typealias ContentBuilder = (Source.Element, Page, Int) -> Content
    typealias LabelBuilder = (Source.Element, Bool) -> ButtonLabel
    private typealias Group = (element: Source.Element, range: Range<Int>)

    @State private(set) var currentPage = 0
    let maxVisibleGroups: Int
    private let pages: [Page]
    private let groups: [Group]
    private let contentBuilder: ContentBuilder
    private let labelBuilder: LabelBuilder

    init(
        source: Source,
        maxVisibleGroups: Int = 4,
        @ViewBuilder content contentBuilder: @escaping ContentBuilder,
        @ViewBuilder buttonLabel labelBuilder: @escaping LabelBuilder
    ) {
        var pages = [Page]()
        var groups = [Group]()
        var lowerBound = 0
        for group in source {
            pages.append(contentsOf: group.pages)
            groups.append((group, lowerBound..<lowerBound + group.pages.count))
            lowerBound += group.pages.count
        }
        self.pages = pages
        self.groups = groups
        self.maxVisibleGroups = maxVisibleGroups
        self.contentBuilder = contentBuilder
        self.labelBuilder = labelBuilder
    }

    private var shownGroups: Range<Int> {
        if let currentGroupIndex = groups.firstIndex(where: { $0.range.contains(currentPage) }) {
            let lowerBound = (currentGroupIndex / maxVisibleGroups) * maxVisibleGroups
            return lowerBound ..< min(lowerBound + maxVisibleGroups, groups.count)
        } else {
            return 0..<0
        }
    }

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(pages.indices) { index in
                    if let group = groups.first(where: { $0.range.contains(index) }) {
                        contentBuilder(group.element, pages[index], index)
                            .tag(index)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            ZStack {

                HStack {
                    if let lowestShownIndex = shownGroups.first, lowestShownIndex > 0 {
                        Button {
                            withAnimation { currentPage = groups[lowestShownIndex - 1].range.lowerBound }
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(colorScheme == .dark ? .lightColor : .darkColor)
                        }
                    }
                    Spacer()
                    if let lastShownGroupIndex = shownGroups.last,
                       let nextGroupIndex = groups.index(after: lastShownGroupIndex),
                       groups.indices.contains(nextGroupIndex) {
                        Button {
                            withAnimation { currentPage = groups[nextGroupIndex].range.lowerBound }
                        } label: {
                            Image(systemName: "chevron.right")
                                .foregroundColor(colorScheme == .dark ? .lightColor : .darkColor)
                        }
                    }
                }

                HStack {
                    Spacer()
                    ForEach(shownGroups.map { groups[$0] }, id: \.range.lowerBound) { group in
                        Button {
                            withAnimation { currentPage = group.range.lowerBound }
                        } label: {
                            labelBuilder(group.element, group.range.contains(currentPage))
                        }
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

private extension Color {
    static var darkColor: Color {
        .init(white: 34.0 / 255.0, opacity: 1.0)
    }

    static var lightColor: Color {
        .init(red: 147.0 / 255.0, green: 147.0 / 255.0, blue: 148.0 / 255.0, opacity: 1.0)
    }
}
