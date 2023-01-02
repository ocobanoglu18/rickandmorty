//
//  GraphEpisodeView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 21.12.2022.
//

import SwiftUI

struct GraphEpisodeView: View {
    @StateObject var data = GraphEpisodeViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.episodes ?? data.placeholders, id: \.id) { episode in
                    NavigationLink(
                        destination: GraphEpisodeViewDetailView(id: episode.id!),
                        label: {
                            GraphEpisodeDetailView(episode: episode)
                        })
                }
            }
            .navigationTitle("Episodes")
     
            .onAppear {
                data.fetchEpisodes()
            }
        }
    }
}

struct GraphEpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        GraphEpisodeView()
    }
}
