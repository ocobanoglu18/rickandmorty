//
//  EpisodeViewViewModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 10.11.2022.
//

import Foundation
import Combine

class EpisodeViewViewModel : ObservableObject {
    
    @Published var episodeState:EpisodeViewModelState=EpisodeViewModelState.initial
    let rickAndMoortyDataService:RickAndMortyDataServices=RickAndMortyDataServices()
    var cancellable = Set<AnyCancellable>()
    @Published var charList = [Results]()
    @Published var location = [Location]()
   
    init() {
        getAllEpisodes()
    }
    
    func getAllEpisodes(){
        episodeState=EpisodeViewModelState.loading
        rickAndMoortyDataService.getAllEpisode()
            .sink { [weak self] completion in
                switch completion{
                    
                case .finished:
                    print("finish")
                case .failure(let error):
                    self?.episodeState=EpisodeViewModelState.error(errorMessage: "\(error)")
                }
            } receiveValue: { [weak self] PagedEpisode in
                self?.episodeState=EpisodeViewModelState.loaded(episode: PagedEpisode)
                
            }
            .store(in: &cancellable)
    }
    
    
  
}
