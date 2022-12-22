//
//  InfoRowView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 21.12.2022.
//

import SwiftUI

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
        }
    }
}

