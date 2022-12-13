//
//  LaunchViewModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 13.12.2022.
//

import Foundation
import Apollo
final class LaunchViewModel: ObservableObject {

    func fetch() {
        Network.shared.apollo.fetch(query: CharacterListQuery()) { result in // Change the query name to your query name
          switch result {
          case .success(let graphQLResult):
            print("Success! Result: \(graphQLResult)")
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }

}
