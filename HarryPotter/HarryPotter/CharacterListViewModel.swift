//
//  CharacterListViewModel.swift
//  HarryPotter
//
//  Created by Shashank  on 11/10/24.
//

import Foundation

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    func fetchCharacters(for house: String) {
        guard let url = URL(string: "https://hp-api.herokuapp.com/api/characters/house/\(house)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let characters = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    self.characters = characters
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}

struct Character: Identifiable, Codable {
    let id = UUID()
    let name: String
    let image: String?
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let hogwartsStaff: Bool?
}
