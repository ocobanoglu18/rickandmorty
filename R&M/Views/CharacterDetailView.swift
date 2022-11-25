//
//  CharacterDetailView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 7.11.2022.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var viewModel:RickAndMortyViewModel=RickAndMortyViewModel()
    @ObservedObject var LocationViewModel:LocationViewViewModel=LocationViewViewModel()

    @State var results: Results?
    @State var location:Location?
    
    
    var body: some View {
        VStack{
            VStack{
                AsyncImage(url: URL(string: results!.image)){ image in
                    
                    image.resizable()
                        .cornerRadius(10)
                    
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 360, height: 320)
            }
            VStack{
                HStack {
                    
                    Text("Character Name")
                    Spacer()
                    Text(results!.name).fontWeight(.bold)
                    Spacer()
                }.padding(.leading).padding(.top)
                HStack {
                    
                    Text("Character Gender")
                    Spacer()
                    Text(results!.gender).fontWeight(.bold)
                    Spacer()
                }.padding(.leading).padding(.top)
                HStack {
                    
                    Text("Character Type")
                    Spacer()
                    Text(results!.type).fontWeight(.bold)
                    Spacer()
                }.padding(.leading).padding(.top)
                HStack {
                    
                    Text("Character Created Date")
                    Spacer()
                    Text(results!.created).fontWeight(.bold)
                    Spacer()
                }.padding(.leading).padding(.top)
                HStack {
                    
                    Text("Character Species")
                    Spacer()
                    Text(results!.species).fontWeight(.bold)
                    Spacer()
                }.padding(.leading).padding(.top)
                HStack {
                    
                    Text("Character Status")
                    Spacer()
                    Text(results!.status).fontWeight(.bold)
                    Spacer()
                }.padding(.leading).padding(.top)
                HStack {
                    
                    Text("Character Status")
                    Spacer()

                }.padding(.leading).padding(.top)
          
            }.padding(.top)
            Spacer()
            Spacer()
                .padding(.bottom)
                
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        
                        
                        Text("Detail View").foregroundColor(Color.white).fontWeight(.bold)
                        
                    }
            }
            }
        Spacer()
        }
    }


struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView()
    }
}
