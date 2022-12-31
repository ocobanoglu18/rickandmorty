//
//  GraphCharacterView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 15.12.2022.
//

import SwiftUI

struct GraphCharacterView: View {
    
    @StateObject var data = LaunchViewModel()
    
    var body: some View {
        List {
            ForEach(data.characters ?? data.placeholders, id: \.id) { character in
                NavigationLink(
                    destination: GraphCharacterViewDetailDetailView(id: character.id!),
                    label: {
                        GraphCharacterDetailView(character: character)
                    })
            }
            
            if data.shouldDisplayNextPage {
                nextPageView
            }
            
        }
            .onAppear {
                data.fetchCharacters()
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
            }
        )
    }
}

struct GraphCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        GraphCharacterView()
    }
}

struct InfoRowView: View {
    let label: String
    let icon: String
    let value: String
    
    var body: some View {
        HStack {
            Label(label, systemImage: icon).foregroundColor(Color.white)
            Spacer()
            Text(value)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }.frame(width: 370, height: 70).background(CustomColor.cardColor)
            .cornerRadius(20)
    }
}

