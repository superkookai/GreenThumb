//
//  MyGardenVegetable.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 14/07/2568.
//

import Foundation
import SwiftData

@Model
class MyGardenVegetable {
    var vegetable: Vegetable
    var plantOption: PlantOption
    var datePlanted: Date
    
    @Relationship(deleteRule: .cascade)
    var notes: [Note]?
    
    var daysToHarvest: Int {
        plantOption == .seed ? vegetable.daysToHarvestSeeds : vegetable.daysToHarvestSeedlings
    }
    
    init(vegetable: Vegetable, plantOption: PlantOption, datePlanted: Date = Date()) {
        self.vegetable = vegetable
        self.plantOption = plantOption
        self.datePlanted = datePlanted
    }
}
