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
        List(myGardenVegetable.notes ?? []) { note in
            HStack(alignment: .center) {
                if let photoData = note.photo, let uiImage = UIImage(data: photoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .clipShape(.circle)
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                    
                } else {
                    Image(systemName: "photo.artframe.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .clipShape(.circle)
                        .foregroundStyle(.secondary)
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                }
                
                Text(note.title)
            }
        }
        .listStyle(.plain)
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
