//
//  HarvestCountDownView.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 15/07/2568.
//

import SwiftUI

struct HarvestCountDownView: View {
    let plantingDate: Date
    let harvestingDays: Int
    
    private var daysElapsed: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: plantingDate, to: .now)
        return max(components.day ?? 0, 0)
    }
    
    private var daysRemaining: Int {
        max(harvestingDays-daysElapsed, 0)
    }
    
    @State var progress: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            //Background Circle
            Circle()
                .stroke(
                    Color.green.opacity(0.2),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
            
            //Progress Circle
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.green, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            //Days Remaining
            VStack {
                Text("\(daysRemaining)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.green)
                
                Text("days")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
            }
        }
        .frame(width: 60, height: 60)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                progress = CGFloat(daysElapsed) / CGFloat(harvestingDays)
            }
        }
    }
}

#Preview {
    HarvestCountDownView(plantingDate: Date().daysAgo(60), harvestingDays: 90)
}
