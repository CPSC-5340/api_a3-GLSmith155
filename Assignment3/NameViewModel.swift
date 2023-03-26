//
//  NameViewModel.swift
//  Assignment3
//
//  Created by user225812 on 3/26/23.
//

import Foundation
import Combine

class NameViewModel: ObservableObject {
    @Published var age: Int? = nil
    @Published var names: [Name] = sampleNames
    var cancellables = Set<AnyCancellable>()

    func fetchAge(for name: String) {
        let url = "https://api.agify.io/?name=\(name)"
        guard let apiUrl = URL(string: url) else { return }

        URLSession.shared.dataTaskPublisher(for: apiUrl)
            .map { $0.data }
            .decode(type: AgifyResponse.self, decoder: JSONDecoder())
            .replaceError(with: AgifyResponse(age: -1, count: -1, name: ""))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] agifyResponse in
                self?.age = agifyResponse.age
            }
            .store(in: &cancellables)
    }
    
    func addName(_ name: String) {
        names.append(Name(name: name))
    }
    
    func removeName(at offsets: IndexSet) {
        names.remove(atOffsets: offsets)
    }
}

struct AgifyResponse: Codable {
    let age: Int
    let count: Int
    let name: String
}
