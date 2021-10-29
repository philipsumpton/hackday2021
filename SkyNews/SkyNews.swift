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

    var body: some View {
        VStack {
            Image("logo")
            
            TeaserView(significance: "Breaking", headline: "Joe does not have a shirt")
            TeaserView(significance: nil, headline: "Joe wont let us go for lunch")
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
