//
//  SkyNews.swift
//  SkyNews
//
//  Created by Phil Sumpton on 29/10/2021.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> ArticleEntry {
        .init(articles: mockArticles())
    }

    func getSnapshot(in context: Context, completion: @escaping (ArticleEntry) -> ()) {
        let entry = ArticleEntry(articles: mockArticles())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [ArticleEntry] = []
        
        let entry = ArticleEntry(date: Date(), articles: mockArticles())
        entries.append(entry)
        
        guard let entryDate = Calendar.current.date(byAdding: .minute, value: 5, to: Date()) else { return }
        
        let timeline = Timeline(entries: entries, policy: .after(entryDate))
        completion(timeline)
    }
}

struct SkyNewsEntryView : View {
    var entry: Provider.Entry
    var mocks = mockArticles()
    
    var body: some View {
        VStack {
            Image("logo")
            Link(destination: URL(string: mocks[0].url)!) {
                TeaserView(article: mocks[0])
            }
            Link(destination: URL(string: mocks[1].url)!) {
                TeaserView(article: mocks[1])
            }
        }
    }
}

@main
struct SkyNews: Widget {
    let kind: String = "SkyNews"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SkyNewsEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

struct SkyNews_Previews: PreviewProvider {
    static var previews: some View {
        SkyNewsEntryView(entry: ArticleEntry(articles: mockArticles()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
