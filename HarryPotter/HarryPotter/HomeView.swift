//
//  HomeView.swift
//  HarryPotter
//
//  Created by Shashank  on 11/10/24.
//

import SwiftUI


struct HomeView: View {
    let houses = [
        House(name: "Gryffindor", imageName: "gryffindorImage", apiName: "gryffindor"),
        House(name: "Slytherin", imageName: "slytherinImage", apiName: "slytherin"),
        House(name: "Ravenclaw", imageName: "ravenclawImage", apiName: "ravenclaw"),
        House(name: "Hufflepuff", imageName: "hufflepuffImage", apiName: "hufflepuff")
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, .purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Hogwarts School")
                                            .font(.custom("Papyrus", size: 32))
                                            .bold()
                                            .foregroundColor(.white)
                                            .shadow(color: .yellow, radius: 5, x: 0, y: 5)
                                            .padding(.top, 30)
                    Text("Of Witchcraft and Wizardry")
                                            .font(.custom("Papyrus", size: 28))
                                            .bold()
                                            .foregroundColor(.white)
                                            .shadow(color: .yellow, radius: 5, x: 0, y: 5)
                                            .padding(.top, 5)
                    Text("HOUSES")
                        .font(.custom("Papyrus", size: 40))
                        .bold()
                        .foregroundColor(.yellow)
                        .shadow(color: .yellow, radius: 5, x: 0, y: 5)
                        .padding(.top, 2)
                    
                   
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(houses, id: \.name) { house in
                            NavigationLink(destination: CharacterListView(house: house)) {
                                HouseItemView(house: house)
                            }
                        }
                    }
                    .padding(.top, 3)
                }
            }
            .navigationTitle("")
        }
    }
}

struct HouseItemView: View {
    let house: House
    
    var body: some View {
        VStack {
            ZStack {
                
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.purple, .blue, .black]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 160, height: 160)
                    .shadow(color: .purple.opacity(0.6), radius: 10, x: 0, y: 5)
                
                Image(house.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.yellow, lineWidth: 3)
                    )
                    .shadow(color: .yellow, radius: 8, x: 0, y: 5)
            }
            
            Text(house.name)
                .font(.custom("Papyrus", size: 20))
                .foregroundColor(.white)
                .shadow(color: .yellow, radius: 5, x: 0, y: 3)
        }
        .padding()
    }
}


struct House: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let apiName: String
}

//struct HouseItemView: View {
//    let house: House
//    
//    var body: some View {
//        VStack {
//            Image(house.imageName)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 150, height: 150)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.black, lineWidth: 1))
//            
//            Text(house.name)
//                .font(.headline)
//        }
//    }
//}
