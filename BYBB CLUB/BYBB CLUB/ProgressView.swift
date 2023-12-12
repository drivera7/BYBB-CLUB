//
//  ProgressView.swift
//  BYBB CLUB
//
//  Created by Diego Rivera on 11/21/23.
//

import SwiftUI
import SwiftUICharts

struct ProgressView: View {
    @EnvironmentObject var manager: HealthManager

    var body: some View {
        VStack {
            // Your progress charts go here
            LineView(data: [10, 25, 15, 30, 20], title: "Workout Progress", legend: "Sets")
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)

            BarChartView(data: ChartData(values: [("Squats", 30), ("Push-ups", 20), ("Pull-ups", 15)]), title: "Exercise Breakdown")
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
        }
        .padding()
    }
}
