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
    
    public var shouldDisplayNextPage: Bool {
        if locations?.isEmpty == false,
           let totalPages = totalPage,
           currentPage < totalPages {
            return true
        }
        return false
    }
    
    public private(set) var totalPage: Int?
    public private(set) var totalCharacters: Int?
    
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
