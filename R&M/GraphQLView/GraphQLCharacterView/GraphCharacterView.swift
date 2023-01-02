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
        NavigationView{
                List {
                ForEach(data.characters ?? data.placeholders, id: \.id) { character in
                    NavigationLink(
                        destination: GraphCharacterViewDetailDetailView(id: character.id!),
                        label: {
                            GraphCharacterDetailView(character: character)
                        }
                    )
                }
                
                }.navigationTitle("Characters")
                .scrollContentBackground(.hidden)
                .scrollIndicators(ScrollIndicatorVisibility.hidden)
                .listRowBackground(Color.purple)
              
 
        }
            .onAppear {
                data.fetchCharacters()
                UITableView.appearance().backgroundColor = UIColor(.black)
                UITableViewCell.appearance().backgroundColor = UIColor(.black)
                
            }
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

