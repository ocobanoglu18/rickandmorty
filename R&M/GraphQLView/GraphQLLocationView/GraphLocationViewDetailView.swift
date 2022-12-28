//
//  GraphLocationViewDetailView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 28.12.2022.
//

import SwiftUI
import Apollo

struct GraphLocationViewDetailView: View {
    @StateObject private var query: SingleQuery<GetLocationQuery>
    
    var location: LocationDetail? {
        query.data?.location?.fragments.locationDetail
    }
    
    init(id: GraphQLID) {
        _query = StateObject(wrappedValue: SingleQuery(query: GetLocationQuery(id: id)))
    }
    
    var body: some View {
        List {
            Section(header: Text("Info")) {
                InfoRowView(label: "Name",
                            icon: "info",
                            value: location?.name ?? "loading...")
                InfoRowView(label: "Dimension",
                            icon: "tornado",
                            value: location?.dimension ?? "loading...")
                InfoRowView(label: "Type",
                            icon: "newspaper",
                            value: location?.type ?? "loading...")
            }.redacted(reason: query.data?.location == nil ? .placeholder : [])
            
            if let characters = location?.residents.compactMap{ $0 }.filter{ $0.id != nil } {
                Section(header: Text("Residents")) {
                    ForEach(characters, id: \.id) { character in
                        NavigationLink(
                            destination: GraphCharacterViewDetailDetailView(id: character.id!),
                            label: {
                                HStack {
                                    if let image = character.image,
                                       let url = URL(string: image) {
                                        Image("\(url)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 28, height: 28)
                                            .cornerRadius(14)
                                    }
                                    Text(character.name!)
                                }
                            })
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle(location?.name ?? "")
    }
}


