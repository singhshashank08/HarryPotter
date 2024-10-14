//
//  CharacterDetailView.swift
//  HarryPotter
//
//  Created by Shashank  on 11/10/24.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(character.name)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    if character.hogwartsStaff ?? false {
                        Image(systemName: "graduationcap.fill")
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(houseColor(character.house ?? ""))
            .cornerRadius(12)
            .shadow(radius: 5)
            
            // Character Image
            AsyncImage(url: URL(string: character.image ?? "")) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            } placeholder: {
                ProgressView()
            }
            .padding(.vertical)
            VStack(spacing: 15) {
                if let species = character.species {
                    DetailRow(title: "Species", value: species)
                }
                if let gender = character.gender {
                    DetailRow(title: "Gender", value: gender)
                }
                if let ancestry = character.ancestry {
                    DetailRow(title: "Ancestry", value: ancestry)
                }
                if let house = character.house {
                    DetailRow(title: "House", value: house)
                        .background(houseColor(house).opacity(0.2))
                        .cornerRadius(8)
                }
                if let dateOfBirth = character.dateOfBirth {
                    DetailRow(title: "Date of Birth", value: formatDateOfBirth(dateOfBirth))
                }
                if let patronus = character.patronus {
                    DetailRow(title: "Patronus", value: patronus)
                }
                if let alive = character.alive {
                    DetailRow(title: "Alive/Deceased", value: alive ? "Alive" : "Deceased")
                }
            }
            .padding()
            .background(Color.white.opacity(0.8))
            .cornerRadius(12)
            .shadow(radius: 5)
            .padding(.horizontal)
        }
        .padding(.bottom, 20)
    }
    
    func houseColor(_ house: String) -> Color {
        switch house {
        case "Gryffindor": return .red
        case "Slytherin": return .green
        case "Ravenclaw": return .blue
        case "Hufflepuff": return .yellow
        default: return .gray
        }
    }
    
    func formatDateOfBirth(_ dateOfBirth: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        if let date = dateFormatter.date(from: dateOfBirth) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            return displayFormatter.string(from: date)
        }
        return dateOfBirth
    }
}

struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .font(.system(size: 16, weight: .regular, design: .default))
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}
