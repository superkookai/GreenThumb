//
//  PestDetailScreen.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 20/07/2568.
//

import SwiftUI

struct PestDetailScreen: View {
    let pest: Pest
    
    var body: some View {
        ScrollView {
            AsyncImage(url: pest.photo) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: 250)
            }
            
            // Description
            SectionView(
                iconName: "info.circle",
                title: "Description",
                content: pest.body
            )
            
            // Symptoms
            SectionView(
                iconName: "exclamationmark.triangle",
                title: "Symptoms",
                content: pest.symptoms
            )
            
            // Treatment
            SectionView(
                iconName: "bandage",
                title: "Treatment",
                content: pest.treatment
            )

        }
        .scrollIndicators(.hidden)
        .padding(.horizontal)
        .navigationTitle(pest.name)
    }
}

struct SectionView: View {
    let iconName: String
    let title: String
    let content: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.blue)
                    .font(.title2)
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationStack {
        PestDetailScreen(pest: PreviewData.loadPests()[1])
    }
}
