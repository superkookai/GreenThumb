//
//  MyGardenScreen.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 15/07/2568.
//

import SwiftUI
import SwiftData

struct MyGardenScreen: View {
    @Query private var myGardenVegetables: [MyGardenVegetable]
    
    var body: some View {
        List(myGardenVegetables) { myGardenVegetable in
            NavigationLink {
                NoteListScreen(myGardenVegetable: myGardenVegetable)
            } label: {
                MyGardenCellView(myGardenVegetable: myGardenVegetable)
            }
        }
        .listStyle(.plain)
        .navigationTitle("My Garden")
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        MyGardenScreen()
    }
}
