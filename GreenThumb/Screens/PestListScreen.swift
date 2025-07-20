//
//  PestListScreen.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 20/07/2568.
//

import SwiftUI

struct PestListScreen: View {
    let pests: [Pest]
    
    @State private var searchText: String = ""
    
    private var filteredPests: [Pest] {
        if searchText.isEmpty {
            return pests
        } else {
            return pests.filter({$0.name.localizedCaseInsensitiveContains(searchText)})
        }
    }
    
    var body: some View {
        List(filteredPests) { pest in
            NavigationLink {
                PestDetailScreen(pest: pest)
            } label: {
                PestCellView(pest: pest)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Pests")
        .searchable(text: $searchText)
    }
}

#Preview {
    NavigationStack {
        PestListScreen(pests: PreviewData.loadPests())
    }
}
