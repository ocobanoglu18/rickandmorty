//
//  Network.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 12.12.2022.
//

import Foundation
import CoreData
import Apollo

class Network {
  static let shared = Network()
    let url = "https://rickandmortyapi.com/graphql"
    private(set) lazy var apollo = ApolloClient(url: URL(string: url)!)
}

