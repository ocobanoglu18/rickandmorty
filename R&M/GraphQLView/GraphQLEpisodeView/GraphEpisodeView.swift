//
//  GraphEpisodeView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 21.12.2022.
//

import SwiftUI

struct GraphEpisodeView: View {
    @StateObject private var data = GraphEpisodeViewModel()
    
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
                if data.shouldDisplayNextPage {
                    nextPageView
                }
            }
            .navigationTitle("Episodes")
     
            .onAppear {
                data.fetchEpisodes()
            }
        }
    }
    
    private var nextPageView: some View {
        HStack {
            Spacer()
            VStack {
                ProgressView()
                Text("Loading next page...")
            }
            Spacer()
        }
        .onAppear(perform: {
            data.currentPage += 1
        })
    }
}

struct GraphEpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        GraphEpisodeView()
    }
}
