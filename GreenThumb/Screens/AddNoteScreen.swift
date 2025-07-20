//
//  AddNoteScreen.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 15/07/2568.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddNoteScreen: View {
    let myGardenVegetable: MyGardenVegetable
    
    @State private var noteTitle: String = ""
    @State private var noteBody: String = ""
    @State private var selectedPhotoItem: PhotosPickerItem? = nil
    @State private var uiImage: UIImage? = nil
    @State private var imageData: Data? = nil
    @State private var isCameraSelected = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    private var isFormValid: Bool {
        !noteTitle.isEmptyOrWhiteSpace && !noteBody.isEmptyOrWhiteSpace
    }
    
    private func saveNote() {
        let note = Note(title: noteTitle, body: noteBody)
        note.photo = imageData
        myGardenVegetable.notes?.append(note)
        try? context.save()
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $noteTitle)
                TextEditor(text: $noteBody)
                    .frame(minHeight: 200)
                
                HStack(spacing: 20) {
                    Button {
                        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                            isCameraSelected = true
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.green.opacity(0.2))
                                .frame(width: 60, height: 60)
                            Image(systemName: "camera.fill")
                                .font(.title)
                                .foregroundColor(.green)
                        }
                    }

                    
                    PhotosPicker(selection: $selectedPhotoItem, matching: .images, photoLibrary: .shared()) {
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.2))
                                .frame(width: 60, height: 60)
                            Image(systemName: "photo.on.rectangle")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                    }
                }
                .buttonStyle(.borderless)
                
                if let uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .frame(maxWidth: 300, maxHeight: 300)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                        .padding()
                }
            }
            .task(id: selectedPhotoItem) {
                if let selectedPhotoItem {
                    do {
                        if let data = try await selectedPhotoItem.loadTransferable(type: Data.self) {
                            self.imageData = data
                            self.uiImage = UIImage(data: data)
                        }
                    } catch {
                        print("ERROR GET PHOTO DATA: \(error.localizedDescription)")
                    }
                }
            }
            .sheet(isPresented: $isCameraSelected, content: {
                ImagePicker(image: $uiImage, sourceType: .camera)
            })
            .onChange(of: uiImage, {
                self.imageData = uiImage?.pngData()
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        saveNote()
                        dismiss()
                    }
                    .disabled(!isFormValid)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationTitle("\(myGardenVegetable.vegetable.name) Note")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview(traits: .sampleData) {
    @Previewable @Query var myGardenVegetables: [MyGardenVegetable]
    AddNoteScreen(myGardenVegetable: myGardenVegetables[0])
}
