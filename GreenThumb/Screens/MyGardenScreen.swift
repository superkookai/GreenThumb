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
    @Environment(\.modelContext) var context
    
    private func deleteMyGardenVegetable(myGardenVegetable: MyGardenVegetable) {
        context.delete(myGardenVegetable)
        do {
            try context.save()
        } catch {
            print("ERROR TO DELETE: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        List(myGardenVegetables) { myGardenVegetable in
            NavigationLink {
                NoteListScreen(myGardenVegetable: myGardenVegetable)
            } label: {
                MyGardenCellView(myGardenVegetable: myGardenVegetable)
            }
            .swipeActions {
                Button("Delete", systemImage: "trash") {
                    deleteMyGardenVegetable(myGardenVegetable: myGardenVegetable)
                }
                .tint(.red)
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
