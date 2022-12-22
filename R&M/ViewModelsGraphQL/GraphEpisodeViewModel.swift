//
//  GraphEpisodeViewModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 21.12.2022.
//

import Foundation
import Apollo

class GraphEpisodeViewModel: ObservableObject {
    @Published public var episodes: [EpisodeDetail]?
    public var placeholders = Array(repeating: EpisodeDetail(id: GraphQLID(0),
                                                             name: nil,
                                                             created: nil,
                                                             airDate: nil,
                                                             characters: [nil]), count: 10)
    
    public var currentPage = 1 {
        didSet {
            fetchEpisodes()
        }
    }
    
    public var shouldDisplayNextPage: Bool {
        if episodes?.isEmpty == false,
           let totalPages = totalPage,
           currentPage < totalPages {
            return true
        }
        return false
    }
    
    public private(set) var totalPage: Int?
    public private(set) var totalCharacters: Int?
    
    func fetchEpisodes() {
        let fetchedPage = currentPage
        Network.shared.apollo.fetch(query: GetEpisodesQuery(page: currentPage)) { [weak self] result in
            switch result {
            case .success(let result):
                if fetchedPage > 1 {
                    if let newEpisodes = result.data?.episodes?.results?.compactMap({ $0?.fragments.episodeDetail }) {
                        self?.episodes?.append(contentsOf: newEpisodes)
                    }
                } else {
                    self?.episodes = result.data?.episodes?.results?.compactMap{ $0?.fragments.episodeDetail }
                }
                self?.totalPage = result.data?.episodes?.info?.pages
                self?.totalCharacters = result.data?.episodes?.info?.count
                
            case .failure(let error):
                print("GraphQL query error: \(error)")
            }
        }
    }
}
