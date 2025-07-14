//
//  PreviewContainer.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 14/07/2568.
//

import Foundation
import SwiftData

let previewContainer: ModelContainer = {
    let container = try! ModelContainer(for: Vegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return container
}()
