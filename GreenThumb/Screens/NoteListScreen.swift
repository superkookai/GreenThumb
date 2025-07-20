//
//  NoteListScreen.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 15/07/2568.
//

import SwiftUI
import SwiftData

struct NoteListScreen: View {
    var myGardenVegetable: MyGardenVegetable
    
    @State private var addNotePresented: Bool = false
    
    var body: some View {
        ZStack {
            if let notes = myGardenVegetable.notes, !notes.isEmpty {
                List(notes) { note in
                    NoteCellView(note: note, placeHolderImage: myGardenVegetable.vegetable.thumbnailImage)
                }
                .listStyle(.plain)
            } else {
                ContentUnavailableView("No Any Notes", systemImage: "pencil.and.list.clipboard.rtl")
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Note") {
                    addNotePresented = true
                }
            }
        }
        .sheet(isPresented: $addNotePresented) {
            AddNoteScreen(myGardenVegetable: myGardenVegetable)
        }
        .navigationTitle("\(myGardenVegetable.vegetable.name)")
    }
}

#Preview(traits: .sampleData) {
    @Previewable @Query var myGardenVegetables: [MyGardenVegetable]
    
    NavigationStack {
        NoteListScreen(myGardenVegetable: myGardenVegetables[0])
    }
}
