//
//  WorkoutEntryView.swift
//  BYBB CLUB
//
//  Created by Diego Rivera on 11/15/23.
//

import SwiftUI

struct WorkoutEntryView: View {
    @EnvironmentObject var manager: HealthManager
    @State private var exercise = ""
    @State private var sets = 0
    @State private var reps = 0
    @State private var weight = 0.0

    var body: some View {
        Form {
            Section(header: Text("Exercise Details")) {
                TextField("Exercise", text: $exercise)
                Stepper("Sets: \(sets)", value: $sets)
                Stepper("Reps: \(reps)", value: $reps)
                Stepper("Weight: \(weight) lb", value: $weight, step: 2.5)
            }

            Button("Log Workout") {
                manager.logWorkout(exercise: exercise, sets: sets, reps: reps, weight: weight)
            }
        }
        .navigationTitle("Log Workout")
    }
}

