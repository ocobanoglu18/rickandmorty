//
//  GraphLocationViewModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 28.12.2022.
//

import Foundation
import Apollo

class GraphLocationViewModel: ObservableObject {
    @Published public var locations: [LocationDetail]?
    var totalPage: Int?
    var totalCharacters: Int?
    public var placeholders = Array(repeating: LocationDetail(id: GraphQLID(0),
                                                              name: nil,
                                                              type: nil,
                                                              dimension: nil,
                                                              residents: []), count: 10)
    
    public var currentPage = 1 {
        didSet {
            fetchLocations()
        }
    }

    
    func fetchLocations() {
        let fetchedPage = currentPage
        Network.shared.apollo.fetch(query: GetLocationsQuery(page: currentPage)) { [weak self] result in
            switch result {
            case .success(let result):
                if fetchedPage > 1 {
                    if let newLocations = result.data?.locations?.results?.compactMap({ $0?.fragments.locationDetail }) {
                        self?.locations?.append(contentsOf: newLocations)
                    }
                } else {
                    self?.locations = result.data?.locations?.results?.compactMap{ $0?.fragments.locationDetail }
                }
                self?.totalPage = result.data?.locations?.info?.pages
                self?.totalCharacters = result.data?.locations?.info?.count
                
            case .failure(let error):
                print("GraphQL query error: \(error)")
            }
        }
    }
}
