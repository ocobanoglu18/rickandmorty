//
//  EpisodeDetailView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 7.11.2022.
//

import SwiftUI

struct EpisodeDetailView: View {
    @ObservedObject var viewModel:RickAndMortyViewModel=RickAndMortyViewModel()
    @State var episode: Episode?
    @State var liked = false

    
    var body: some View {
        Spacer()
        VStack{
            
            HStack {
                Spacer()
                Image(systemName: "text.quote").fontWeight(.bold).padding(.leading)
                Text(episode!.name).fontWeight(.bold).font(.system(size: 30))
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
            Spacer()
            Spacer()
            HStack {
                Image(systemName: "list.dash.header.rectangle").padding(.leading)
                Spacer()
                Text(episode!.episode)
                Spacer()
            }
            Spacer()
            HStack {
                Image(systemName: "calendar").padding(.leading)
                Spacer()
                Text(episode!.air_date)
                Spacer()
            }
            Spacer()
            HStack {
                Image(systemName: "ellipsis.curlybraces").padding(.leading)
                Spacer()
                Text(episode!.url)
                Spacer()
                
            }
            Spacer()
        }.frame(width: 300,height: 380).background(Color.purple).cornerRadius(30)
        Spacer()
        Spacer()
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView()
    }
}
