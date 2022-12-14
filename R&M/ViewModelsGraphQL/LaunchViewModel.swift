//
//  LaunchViewModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 13.12.2022.
//

import Apollo
import Foundation
import SwiftUI

final class LaunchViewModel: ObservableObject {
    @Published public var characters: [CharacterSmall]?
    public var totalPage: Int?
    public var totalCharacters: Int?

    public var placeholders = Array(repeating: CharacterSmall(id: GraphQLID(0),
                                                              name: nil,
                                                              image: nil,
                                                              episode: [nil]), count: 10)

    
    var currentPage = 1 {
        didSet {
            fetchCharacters()
        }
    }
    func fetchCharacters() {
        let fetchedPage = currentPage
        Network.shared.apollo.fetch(query: GetCharactersQuery(page: currentPage)) { [weak self] result in
            switch result {
            case .success(let result):
                if fetchedPage > 1 {
                    if let newCharacters = result.data?.characters?.results?.compactMap({ $0?.fragments.characterSmall }) {
                        self?.characters?.append(contentsOf: newCharacters)
                    }
                } else {
                    self?.characters = result.data?.characters?.results?.compactMap { $0?.fragments.characterSmall }
                }
                self?.totalPage = result.data?.characters?.info?.pages
                self?.totalCharacters = result.data?.characters?.info?.count

            case .failure(let error):
                print("GraphQL query error: \(error)")
            }
        }
    }
}
