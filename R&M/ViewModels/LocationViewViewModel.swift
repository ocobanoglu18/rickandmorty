//
//  LocationViewViewModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 10.11.2022.
//

import Foundation
import Combine

class LocationViewViewModel : ObservableObject {
    
    @Published var locationState:LocationViewModelState=LocationViewModelState.initial
    @Published var locationState2:LocationViewModelState2=LocationViewModelState2.initial
    let rickAndMoortyDataService:RickAndMortyDataServices=RickAndMortyDataServices()
    var cancellable = Set<AnyCancellable>()
    @Published var list = [Location]()
    @Published var charList: Results?
   
    init() {
        getAllLocations()
        getAllLocationbyID(charID: charList!.id)
    }
    
    func getAllLocations(){
        locationState=LocationViewModelState.loading
        rickAndMoortyDataService.getAllLocations()
            .sink { [weak self] completion in
                switch completion{
                    
                case .finished:
                    print("finish")
                case .failure(let error):
                    self?.locationState=LocationViewModelState.error(errorMessage: "\(error)")
                }
            } receiveValue: { [weak self] PagedLocation in
                self?.locationState=LocationViewModelState.loaded(location: PagedLocation)
            }
            .store(in: &cancellable)
    }
    
        func getAllLocationbyID(charID:Int){
            rickAndMoortyDataService.getAllLocationbyID(charID:charID)
                .sink { [weak self] completion in
                    switch completion{
    
                    case .finished:
                        print("finish")
                    case .failure(let error):
                        self?.locationState2=LocationViewModelState2.error(errorMessage2: "\(error)")
                    }
                } receiveValue: { [weak self] Location in
                    self?.locationState2=LocationViewModelState2.loaded(location2: Location)
                }
                .store(in: &cancellable)
        }
    

    
    func getLocationDetailsByCharId(for id:Int) -> Location {
        var result=list.filter {
            $0.id==id
        }
        return result[0]
    }
}
