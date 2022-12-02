//
//  Episodes.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 4.11.2022.
//

import SwiftUI

struct EpisodeView: View {
    @StateObject private var viewModelEpisode=EpisodeViewViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        VStack{
        NavigationView {
            ScrollView {
                VStack(spacing:2) {
                    ForEach(viewModelEpisode.episodeResponse) { episode in
                        VStack {
                            NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                                EpisodeCardView(episode: episode)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }
                            Divider()
                        }
                    }
                }
            }
                .onAppear() {
                viewModelEpisode.initialize()
            }
                .navigationTitle("Episodes")
        }
      
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Episodes").foregroundColor(Color.white).fontWeight(.bold)
                        
                    }
                }
            }
            
            
        }
    }

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView()
    }
}
