//
//  ArticleConfiguration.swift
//  Hackday
//
//  Created by Phil Sumpton on 29/10/2021.
//

import Foundation
import WidgetKit

struct Article {
    let significance: String?
    let headline: String
    let image: String
    let id: Int
    let url: String
}

struct ArticleEntry: TimelineEntry {
    var date = Date()
    var articles: [Article]
}
