//
//  ContentView.swift
//  Hackday
//
//  Created by Phil Sumpton on 29/10/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var deeplink: Deeplink
    
    
    var body: some View {
        ZStack {
            Image("skynews")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            if deeplink.isPresented {
                CoolView(url: deeplink.url!.absoluteString)
                
            }
        }
    }
}

struct CoolView: View {
    var url: String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Text(url)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
