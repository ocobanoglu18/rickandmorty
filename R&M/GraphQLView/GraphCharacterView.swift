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
        List{
            ForEach(data.characters ?? data.placeholders, id: \.id) { results in
                HStack{
                    Text(results.id!)
                }
            }
        }
        .onAppear {
            data.fetchCharacters()
        }
    }
}

struct GraphCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        GraphCharacterView()
    }
}
