//
//  CharacterView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 2.11.2022.
//

import SwiftUI

struct CharacterView: View {
    
    @StateObject var viewModel=RickAndMortyViewModel()
    @StateObject var viewModelEpisode:EpisodeViewViewModel=EpisodeViewViewModel()

    
    @State private var searchTextChar = ""
    @State private var searchText = ""
    @State var filter = ""
    var episode: EpisodeResult?
  
    @State var searchList=[Results]()
  
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false){
                    VStack {
                        HStack {
                            
                            Text("Images from episodes").padding(.leading).foregroundColor(Color.white).fontWeight(.bold)
                            Spacer()
                        }
                        HStack{
                            Image("Logo").frame(width: 110,height: 110).cornerRadius(10).padding(.bottom)
                            Image("Logo1").frame(width: 110,height: 110).cornerRadius(10).padding(.bottom)
                            Image("Logo2").frame(width: 110,height: 110).cornerRadius(10).padding(.bottom)
                            
                        }
                        Spacer()
                            .padding(.bottom)

                        HStack {
                            
                            Text("Characters").padding(.leading).foregroundColor(Color.white).fontWeight(.bold)
                            Spacer()
                        }
                        HStack(spacing: 10) {
                            Button {
                                filter = ""
                                viewModel.initialize(filter: filter)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 60, height: 30, alignment: .center)
                                        .foregroundColor(.black)
                                    Text("Main")
                                        .foregroundColor(Color.white)
                                }
                            }
                            Divider()
                            HStack {
                                Button {
                                    filter = "dead"
                                    viewModel.initialize(filter: filter)

                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 80, height: 30, alignment: .center)
                                            .foregroundColor(Color.black)
                                        Text("Dead")
                                            .foregroundColor(Color.white)
                                    }
                                }
                                Divider()
                                Button {
                                    filter = "unknown"
                                    viewModel.initialize(filter: filter)

                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 80, height: 30, alignment: .center)
                                            .foregroundColor(Color.black)
                                        Text("Unknown").font(.system(size: 15))
                                            .foregroundColor(Color.white)
                                    }
                                }
                            }
                        }
                        ForEach(viewModel.rickAndMortyResponse){ results in
                            VStack {
                                CharacterCardView(character: results)
                               
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                                Divider()
                            }
                        } .onAppear() {
                            viewModel.initialize(filter: filter)
                        }
                    }
                
            }.toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Rick&Morty App!").foregroundColor(Color.white).fontWeight(.bold)
                }
            }
            
        }   .searchable(text: $searchText, prompt: "Look for something")
          
        
    }

    
}


struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}


