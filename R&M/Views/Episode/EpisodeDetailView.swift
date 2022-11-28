//
//  EpisodeDetailView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 7.11.2022.
//

import SwiftUI

struct EpisodeDetailView: View {
    @ObservedObject var viewModel:RickAndMortyViewModel=RickAndMortyViewModel()
    @State var liked = false
    var episode: EpisodeResult?
    @ObservedObject var charactersThisEpisode = EpisodeDetailViewModel()
    @State var selectedCharacter: Character?

    
    var body: some View {
        Spacer()
        VStack{
            
            HStack {
                Spacer()
                Image(systemName: "text.quote").fontWeight(.bold).padding(.leading)
                Text(episode?.name ?? "").fontWeight(.bold).font(.system(size: 30))
                Spacer()
                Button {
                   
                    liked.toggle()
                } label: {
                    if(liked==false){
                        Image(systemName: "heart").resizable().foregroundColor(    Color.white).frame(width: 30,height: 30).padding(.trailing)
                    }else if(liked==true){
                        Image(systemName: "heart.fill").resizable().foregroundColor(    Color.white).frame(width: 30,height: 30).padding(.trailing)
                    }
                }.frame(width: 60,height: 60)
           
            }

            HStack {
                Image(systemName: "list.dash.header.rectangle").padding(.leading)
                Spacer()
                Text(episode?.episode ?? "")
                Spacer()
            }

            HStack {
                Image(systemName: "calendar").padding(.leading)
                Spacer()
                Text(episode?.airDate ?? "")
                Spacer()
            }
            Spacer()
            HStack {
                Image(systemName: "ellipsis.curlybraces").padding(.leading)
                Spacer()
                Text(episode?.url ?? "")
                Spacer()
                
            }
            HStack {
                Text("Characters in This Episode").padding(.leading)
            }

            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                    ForEach((charactersThisEpisode.chars)) { character in
                        Button {
                       
                            selectedCharacter = character
                        } label: {
                            ZStack(alignment: .bottom) {
                                AsyncImage(url: URL(string: character.image ?? "")) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .cornerRadius(8)
                                } placeholder: {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.red)
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .overlay(ProgressView())
                                        .cornerRadius(8)
                                }
                                RoundedRectangle(cornerRadius: 4)
                                    .opacity(0.7)
                                    .frame(width: 150, height: 50)
                                Text(character.name ?? "")
                                    .foregroundColor(Color.white)
                                    .padding(10)
                            }
                        }

                    }
                }
                    .onAppear() {
                    charactersThisEpisode.initialize(episode: episode!)
                }
            }
            Spacer()
        }.frame(width: 400,height: 800).background(Color.purple).cornerRadius(20)
        Spacer()
        Spacer()
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView()
    }
}
