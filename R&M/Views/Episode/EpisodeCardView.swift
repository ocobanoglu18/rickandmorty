//
//  EpisodeCardView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 28.11.2022.
//

import SwiftUI

struct EpisodeCardView: View {
    var episode: EpisodeResult?
    var body: some View {
        VStack {
            HStack {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 121, height: 121, alignment: .center)
                            .foregroundColor(Color.yellow)
                        Text(episode?.id?.toString() ?? "1")
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                            .font(.system(size: 60))
                    }
                }
                HStack {
                    VStack(spacing: 10) {
                        HStack {
                            Text(episode?.name ?? "Pilot")
                                .font(.body)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        HStack {
                            Text(episode?.airDate ?? "December 2, 2013")
                                .font(.body)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        HStack {
                            Text(episode?.episode ?? "S01E01")
                                .font(.body)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    Spacer()
                }.padding()
            }
        }
    }
}

struct EpisodeCardView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCardView()
    }
}
