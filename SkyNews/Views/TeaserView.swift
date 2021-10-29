//
//  TeaserView.swift
//  Hackday
//
//  Created by Phil Sumpton on 29/10/2021.
//

import SwiftUI

struct TeaserView: View {
    var article: Article
    
    var body: some View {
        HStack(spacing: 20) {
            Image("placeholder")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
            
            VStack(alignment: .leading) {
                if article.significance != nil {
                    Text(article.significance ?? "")
                        .font(.system(size: 10))
                        .foregroundColor(.yellow)
                }

                Text(article.headline)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct TeaserView_Previews: PreviewProvider {
    static var previews: some View {
        TeaserView(article: .init(significance: "Breaking", headline: "Joe does not have a shirt", image: "https://thumbnails.cbc.ca/maven_legacy/thumbnails/332/743/KXVO-Pumpkin-Dance_2500kbps_852x480_1079501379954.jpg", id: 123 ))
    }
}
