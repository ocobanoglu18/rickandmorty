//
//  GraphLocationDetailView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 28.12.2022.
//

import SwiftUI

struct GraphLocationDetailView: View {
    let location: LocationDetail
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(location.name ?? "Loading...")
                    .foregroundColor(.white)
                Text("\(location.residents.count ?? 0) resident(s)")
                    .fontWeight(.bold)
            }
            Spacer()
            Text(location.dimension ?? "Loading...")
                .foregroundColor(.white)
            Image(systemName: "location.viewfinder").foregroundColor(Color.white).padding(.trailing, 15)
        }
    }
}

