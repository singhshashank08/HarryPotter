//
//  CharacterListView.swift
//  HarryPotter
//
//  Created by Shashank  on 11/10/24.
//

import SwiftUI

struct CharacterListView: View {
    let house: House
    @StateObject var viewModel = CharacterListViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.characters, id: \.id) { character in
                    CharacterDetailView(character: character)
                }
            }
            .padding()
            .navigationTitle(house.name)
            .onAppear {
                viewModel.fetchCharacters(for: house.apiName)
            }
        }
    }
}

