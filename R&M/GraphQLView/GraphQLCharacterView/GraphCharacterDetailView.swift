//
//  GraphCharacterDetailView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 19.12.2022.
//

import SwiftUI

struct GraphCharacterDetailView: View {
    let character: CharacterSmall

    var body: some View {
        HStack {
            if let image = character.image,
               let url = URL(string: image)
            {
                AsyncImage(
                    url: url,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 300, maxHeight: 100)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 50, height: 50)
                    .foregroundColor(CustomColor.cardColor)
            }
            VStack(alignment: .leading) {
                Text(character.name ?? "Loading...")
                    .foregroundColor(.white)
                    .redacted(reason: character.name == nil ? .placeholder : [])
                Text("\(character.episode.count ?? 0) episodes")
                    .foregroundColor(.white)
                    .redacted(reason: character.episode == nil ? .placeholder : [])
            }
        }
    }
}
