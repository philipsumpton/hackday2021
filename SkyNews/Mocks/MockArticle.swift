//
//  MockArticle.swift
//  Hackday
//
//  Created by Phil Sumpton on 29/10/2021.
//

import Foundation

func mockArticles() -> [Article] {
    return [
        .init(
            significance: "Breaking",
            headline: "Ooooo errr Pumpkin man spotted at the dock",
            image: "https://thumbnails.cbc.ca/maven_legacy/thumbnails/332/743/KXVO-Pumpkin-Dance_2500kbps_852x480_1079501379954.jpg",
            id: 123,
            url: "https://news.sky.com/story/covid-sky-news-coronavirus-live-blog-uk-latest-daily-cases-deaths-12443026"
        ),
        .init(
            significance: nil,
            headline: "Joe has no shirt",
            image: "https://thumbnails.cbc.ca/maven_legacy/thumbnails/332/743/KXVO-Pumpkin-Dance_2500kbps_852x480_1079501379954.jpg",
            id: 123,
            url: "https://news.sky.com/story/government-accelerates-planning-for-collapse-of-big-energy-supplier-bulb-12453948"
        )
    ]
}
