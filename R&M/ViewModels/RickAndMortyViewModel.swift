//
//  RickAndMortyViewModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 2.11.2022.
//

import Foundation
import Combine


class RickAndMortyViewModel : ObservableObject {

    @Published var charactersState:CharacterViewModelState=CharacterViewModelState.initial
    let rickAndMoortyDataService:RickAndMortyDataServices=RickAndMortyDataServices()
    var cancellable = Set<AnyCancellable>()
    @Published var charList = [Results]()
    @Published var location = [Location]()
    
    init() {
        getAllCharacters()
    }
    
    func getAllCharacters(){
        charactersState=CharacterViewModelState.loading
        rickAndMoortyDataService.getAllCharacters()
            .sink { [weak self] completion in
                switch completion{
                    
                case .finished:
                    print("finish")
                case .failure(let error):
                    self?.charactersState=CharacterViewModelState.error(errorMessage: "\(error)")
                }
            } receiveValue: { [weak self] Characters in
                self?.charactersState=CharacterViewModelState.loaded(characters: Characters)
                self!.charList=Characters.results
            }
            .store(in: &cancellable)
    }

}
