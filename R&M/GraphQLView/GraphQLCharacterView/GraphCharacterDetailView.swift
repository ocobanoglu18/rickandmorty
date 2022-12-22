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
               let url = URL(string: image) {
                Image(systemName:"\(url)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
            }
            VStack(alignment: .leading) {
                Text(character.name ?? "Loading...")
                    .font(.title3)
                    .foregroundColor(.accentColor)
                    .redacted(reason: character.name == nil ? .placeholder : [])
                Text("\(character.episode.count ?? 0) episode(s)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .redacted(reason: character.episode == nil ? .placeholder : [])
            }
        }
    }
}


