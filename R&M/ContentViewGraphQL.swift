//
//  ContentViewGraphQL.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 13.12.2022.
//

import SwiftUI

struct ContentViewGraphQL: View {
    
    var body: some View {
        TabView{
            GraphCharacterView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            GraphEpisodeView()
                .tabItem {
                    Image(systemName: "list.triangle")
                }
            GraphLocationView()
                .tabItem {
                    Image(systemName: "map")
                }
        }
    }
}

struct ContentViewGraphQL_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewGraphQL()
    }
}
