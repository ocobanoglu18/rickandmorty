//
//  Locations.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 2.11.2022.
//

import SwiftUI

struct Locations: View {
    @StateObject private var viewModelLocation:LocationViewViewModel=LocationViewViewModel()
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView {
            
                ScrollView(showsIndicators: false){
                    switch viewModelLocation.locationState{
                        
                    case .initial:
                        ProgressView()
                    case .loading:
                        ProgressView()
                    case .error(let error):
                        Text(error)
                    case .loaded(let data):
                        Text("\(searchText)")
                            .searchable(text: $searchText, prompt: "Look for something")
                            
                        ForEach(data.results){ results in
                                
                                HStack {
                                 
                                        VStack{
                                            HStack{
                                                Text(results.name).foregroundColor(Color.white)    .font(.system(size:18)).bold()
                                                    .lineLimit(4)
                                                Image(systemName: "mappin.square.fill").foregroundColor(Color.white)
                                            }
                                            Text(results.type).foregroundColor(Color.white)    .font(.system(size:14)).bold()
                                        }
                                         
                                    
                                    Spacer()
                                    HStack{
                                    
                                        Image(systemName: "arrow.right").foregroundColor(Color.white).padding(.trailing,15)
                                    }

                                }.frame(width:340, height: 40).background(Color.black).opacity(0.8)
                                    .padding(.top)
                                    .padding(.bottom)
                               Spacer()
                                
                                Divider()
                            }
                        }
                    
                }
            
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Locations").foregroundColor(Color.white).fontWeight(.bold)

                    }
                }
        }
    }
}

struct Locations_Previews: PreviewProvider {
    static var previews: some View {
        Locations()
    }
}
