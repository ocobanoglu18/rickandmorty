//
//  GraphCharacterViewDetailDetailView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 21.12.2022.
//

import SwiftUI
import Apollo

struct GraphCharacterViewDetailDetailView: View {
    @StateObject private var query: SingleQuery<GetCharacterQuery>

    var character: CharacterFull? {
        query.data?.character?.fragments.characterFull
    }
    
    init(id: GraphQLID) {
        _query = StateObject(wrappedValue: SingleQuery(query: GetCharacterQuery(id: id)))
    }
    

    
    
    
    
    var body: some View {
        List {
            Section(header: Text("Picture")) {
                HStack {
                    Spacer()
                    if let image = character?.image,
                       let url = URL(string: image) {
                        AsyncImage(
                            url: url,
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(20)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    } else {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
            }
            
            infoSection
//            locationSection
//
            if let episodes = character?.episode.compactMap{ $0 } {
                Section(header: Text("Episodes")) {
                    ForEach(episodes, id: \.id) { episode in
                        NavigationLink(
                            destination: GraphEpisodeViewDetailView(id: episode.id!),
                            label: {
                                HStack {
                                    Text(episode.name!)
                                    Spacer()
                                    Text(episode.airDate!)
                                        .foregroundColor(.gray)
                                        .font(.footnote)
                                }
                            })
                    }
                }
            }
            
        }
        .listStyle(GroupedListStyle())
        .navigationTitle(character?.name ?? "Loading...")
    }
    
    private var infoSection: some View {
        Section(header: Text("Info"),
                content: {
                    InfoRowView(label: "Species",
                                icon: "hare",
                                value: character?.species ?? "loading...")
                    InfoRowView(label: "Gender",
                                icon: "eyes",
                                value: character?.gender ?? "loading...")
                    InfoRowView(label: "Status",
                                icon: "waveform.path.ecg.rectangle",
                                value: character?.status ?? "loading...")
                })
            .redacted(reason: character == nil ? .placeholder : [])
    }
    
//    private var locationSection: some View {
//        Section(header: Text("Location")) {
//            NavigationLink(
//                destination:
//                    LocationDetailView(id: character?.location?.id ?? GraphQLID(0)),
//                label: {
//                    InfoRowView(label: "Location",
//                                icon: "map",
//                                value: character?.location?.name ?? "loading...")
//                })
//            NavigationLink(
//                destination:
//                    LocationDetailView(id: character?.origin?.id ?? GraphQLID(0)),
//                label: {
//                    InfoRowView(label: "Origin",
//                                icon: "paperplane",
//                                value: character?.origin?.name ?? "loading...")
//                })
//        }
//        .redacted(reason: character == nil ? .placeholder : [])
//    }
}

struct GraphCharacterViewDetailDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GraphCharacterViewDetailDetailView(id: GraphQLID(1))
        }
    }
}
