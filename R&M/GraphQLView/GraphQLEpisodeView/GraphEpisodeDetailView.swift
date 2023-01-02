//
//  GraphEpisodeDetailView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 21.12.2022.
//

import SwiftUI

struct GraphEpisodeDetailView: View {
    let episode: EpisodeDetail
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(Color.black)
                Text(episode.id ?? "1")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 40))
            }
            VStack(alignment: .leading) {
                Text(episode.name ?? "Loading...")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text(episode.episode ?? "Loading...")
            }
            Spacer()
            Text(episode.airDate ?? "Loading...")
                .foregroundColor(.white)

        }

    }
}

