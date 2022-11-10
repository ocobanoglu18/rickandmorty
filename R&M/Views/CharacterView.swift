//
//  CharacterView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 2.11.2022.
//

import SwiftUI

struct CharacterView: View {
    
    @StateObject var viewModel:RickAndMortyViewModel=RickAndMortyViewModel()
    @StateObject var viewModelEpisode:EpisodeViewViewModel=EpisodeViewViewModel()
    @State private var searchTextChar = ""
    @StateObject var favorites=Favorites()
    
    
    
    var body: some View {
        NavigationView {
            
            ScrollView(showsIndicators: false){
                switch viewModel.charactersState{
                    
                case .initial:
                    ProgressView()
                case .loading:
                    ProgressView()
                case .error(let error):
                    Text(error)
                case .loaded(let data):
                    
                    Text("\(searchTextChar)")
                        .searchable(text: $searchTextChar, prompt: "Look for something")
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
                            Text("Favorite Episodes").padding(.leading).foregroundColor(Color.white).fontWeight(.bold)
                            Spacer()
                        }
                        switch viewModelEpisode.episodeState{
                        case .initial:
                            ProgressView()
                        case .loading:
                            ProgressView()
                        case .error(let error):
                            Text(error)
                        case .loaded(let data):
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack {
                                    ForEach(data.results) { results in
                                        
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                Image(systemName: "text.quote").padding(.leading).fontWeight(.bold)
                                                Spacer()
                                                Text(results.name).lineLimit(2).fontWeight(.bold).font(.system(size: 12))
                                                Spacer()
                                            }
                                            
                                            HStack {
                                                
                                                Image(systemName: "calendar").padding(.leading)
                                                Spacer()
                                                Text(results.air_date).font(.system(size: 8))
                                                Spacer()
                                            }
                                            
                                            HStack {
                                                
                                                Image(systemName: "list.dash.header.rectangle").padding(.leading)
                                                Spacer()
                                                Text(results.episode) .font(.system(size: 10))
                                                Spacer()
                                            }
                                            
                                            
                                        }   .frame(width:170,height: 65).background(Color.purple).cornerRadius(15)
                                        
                                    }
                                }
                            }
                        }
                        
                        HStack {
                            
                            Text("Characters").padding(.leading).foregroundColor(Color.white).fontWeight(.bold)
                            Spacer()
                        }
                        ForEach(data.results){ results in
                            
                            HStack {
                                VStack{
                                    AsyncImage(url: URL(string: results.image)){ image in
                                        
                                        image.resizable()
                                            .cornerRadius(10)
                                        
                                        
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 130, height: 120)
                                }
                                Spacer()
                                VStack{
                                    Spacer()
                                    Text(results.name)
                                        .font(.system(size:22)).bold()
                                    HStack{
                                        Text(results.gender)
                                            .font(.system(size:16))
                                            .fontWeight(.regular)
                                        
                                        
                                        Divider().foregroundColor(Color.white).fontWeight(.bold).frame(height:16)
                                        
                                        Text(results.species)
                                            .font(.system(size:16))
                                            .fontWeight(.light)
                                        
                                    }
                                    Spacer()
                                    
                                }
                                Spacer()
                                HStack{
                                    //                                    Button {
                                    //                                        CharacterDetailView(character:character)
                                    //                                    } label: {
                                    //                                    Image(systemName: "arrow.right")
                                    //                                    }
                                    
                                    NavigationLink {
                                        CharacterDetailView(results:results)
                                    } label: {
                                        Image(systemName: "arrow.right.circle")
                                            .font(.system(size:25))
                                            .padding(.top,5)
                                            .padding(.trailing,6)
                                            .foregroundColor(.white)
                                        
                                    }
                                    
                                }
                                Spacer()
                                
                                
                                
                            }.frame(width:370, height: 70).background(CustomColor.cardColor)
                                .cornerRadius(20)
                            
                            
                            
                            Divider()
                        }
                    }
                }
                
            }
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    
                    
                    Text("Rick&Morty App!").foregroundColor(Color.white).fontWeight(.bold)
                    
                }
            }
            
            
            
        }
        
        
    }
    
    
}


struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}


