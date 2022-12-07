//
//  LocationCardView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 7.12.2022.
//

import SwiftUI

struct LocationCardView: View {
    var location: LocationResult?

    var body: some View {
        VStack {

                HStack {
                            Text((location?.name)!)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                    Spacer()
                    HStack{
                        VStack{
                            Text("Dimesion").foregroundColor(Color.white).font(.system(size: 12))
                            Text((location?.dimension)!).foregroundColor(Color.white).font(.system(size: 13)).lineLimit(1)
                        }
                        Image(systemName: "location.viewfinder").foregroundColor(Color.white).padding(.trailing,15)
                    }
                    
                }.padding(.trailing, 20).background(Color.black)
            Spacer()
            
        }.background(Color.black)
    }
}

struct LocationCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCardView()
    }
}
