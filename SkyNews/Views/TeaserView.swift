//
//  TeaserView.swift
//  Hackday
//
//  Created by Phil Sumpton on 29/10/2021.
//

import SwiftUI

struct TeaserView: View {
    var significance: String?
    var headline: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image("placeholder")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
            
            VStack(alignment: .leading) {
                if significance != nil {
                    Text(significance ?? "")
                        .font(.system(size: 10))
                        .foregroundColor(.yellow)
                }

                Text(headline)
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
        TeaserView(significance: "Breaking", headline: "Joe does not have a shirt")
    }
}
