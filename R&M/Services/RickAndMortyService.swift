//
//  RickAndMortyService.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 2.11.2022.
//

import Foundation
import Combine

protocol RickAndMortyService {
    func getAllCharacters () -> AnyPublisher<Characters,Error>
    func getAllLocations() -> AnyPublisher<PagedLocation, Error>
    func getAllEpisode() -> AnyPublisher<PagedEpisode, Error>
    func getAllLocationbyID(charID:Int) -> AnyPublisher<Location, Error>
 
}
