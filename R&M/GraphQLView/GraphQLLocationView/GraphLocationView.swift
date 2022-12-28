//
//  GraphLocationView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 28.12.2022.
//

import SwiftUI

struct GraphLocationView: View {
    @StateObject private var data = GraphLocationViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.locations ?? data.placeholders, id: \.id) { location in
                    NavigationLink(
                        destination: GraphLocationViewDetailView(id: location.id!),
                        label: {
                            GraphLocationDetailView(location: location)
                        })
                }
                if data.shouldDisplayNextPage {
                    nextPageView
                }
            }
            .navigationTitle("Locations")
            .onAppear {
                data.fetchLocations()
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

struct GraphLocationView_Previews: PreviewProvider {
    static var previews: some View {
        GraphLocationView()
    }
}
