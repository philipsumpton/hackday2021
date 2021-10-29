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
            image: "",
            link: ""
        ),
        .init(
            significance: nil,
            headline: "Joe has no shirt",
            image: "",
            link: ""
        )
    ]
}
