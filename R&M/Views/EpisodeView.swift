//
//  Episodes.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 4.11.2022.
//

import SwiftUI

struct EpisodeView: View {
    @StateObject private var viewModelEpisode:EpisodeViewViewModel=EpisodeViewViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State var liked = false
    @State var episode: Episode?
    
    
    var body: some View {
        VStack{
            NavigationView {
                
                ScrollView(showsIndicators: false){
                    switch viewModelEpisode.episodeState{
                        
                    case .initial:
                        ProgressView()
                    case .loading:
                        ProgressView()
                    case .error(let error):
                        Text(error)
                    case .loaded(let data):
                        VStack{
                            Text("Below you can acces all episodes").padding(.bottom)
                            
                        }
                        Divider().frame(height:30).font(.largeTitle)
                        
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(data.results) { results in
                                NavigationLink {
                                    EpisodeDetailView(episode:results)
                                } label: {
                                    VStack{
                                        Spacer()
                                        HStack {
                                            
                                            Image(systemName: "text.quote").fontWeight(.bold).padding(.leading)
                                            Text(results.name).lineLimit(2).fontWeight(.bold)
                                            Spacer()
                                        }
                                        Spacer()
                                        HStack {
                                            
                                            Image(systemName: "calendar").padding(.leading)
                                            Text(results.air_date).font(.system(size: 12))
                                            Spacer()
                                        }
                                        Spacer()
                                        HStack {
                                            
                                            Image(systemName: "list.dash.header.rectangle").padding(.leading)
                                            Text(results.episode) .font(.system(size: 14))
                                            Spacer()
                                        }
                                        Spacer()
                                    }.frame(width:170,height: 130).background(CustomColor.cardColor).cornerRadius(15)
                                }
                                
                                
                            }
                            
                        }
                        
                        
                        
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Episodes").foregroundColor(Color.white).fontWeight(.bold)
                        
                    }
                }
            }
            
            
        }
    }
}
struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView()
    }
}
