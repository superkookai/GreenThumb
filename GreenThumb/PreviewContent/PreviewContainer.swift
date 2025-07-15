//
//  PreviewContainer.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 14/07/2568.
//

import Foundation
import SwiftData

let previewContainer: ModelContainer = {
    let container = try! ModelContainer(for: Vegetable.self, MyGardenVegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    let sampleVegetable = PreviewData.loadVegetables()[1]
    let sampleMyGardenVegetable = MyGardenVegetable(vegetable: sampleVegetable, plantOption: .seed, datePlanted: Date().daysAgo(20))
    
    Task { @MainActor in
        container.mainContext.insert(sampleVegetable)
        container.mainContext.insert(sampleMyGardenVegetable)
    }
    
    return container
}()
