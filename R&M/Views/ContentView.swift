//
//  ContentView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 2.11.2022.
//

import SwiftUI
import Combine

struct CustomColor {
    static let cardColor = Color("cardColor")
  
}

struct ContentView: View {
    @StateObject var favorites = Favorites()
    var body: some View {
 
        TabView{
            CharacterView()
                .tabItem {
                    Image(systemName: "house")
                }
         
            EpisodeView()
                .tabItem{
                    Image(systemName: "list.triangle")
                }
            Locations()
                   .tabItem {
                       Image(systemName: "map.circle")
                   }
        
            
        }.accentColor(Color.white)
        .environmentObject(favorites)
  
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
