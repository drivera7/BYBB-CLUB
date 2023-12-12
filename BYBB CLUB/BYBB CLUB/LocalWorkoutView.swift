//
//  LocalWorkoutView.swift
//  BYBB CLUB
//
//  Created by Diego Rivera on 11/18/23.
//

import SwiftUI

struct LocalWorkoutView: View {
    @FetchRequest(entity: WorkoutEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \WorkoutEntity.date, ascending: false)]) var workouts: FetchedResults<WorkoutEntity>

    var body: some View {
        List(workouts, id: \.id) { workout in
            Text("Exercise: \(workout.exercise ?? "") Sets: \(workout.sets) Reps: \(workout.reps) Weight: \(workout.weight)")
        }
    }
}

struct LocalNutritionView: View {
    @FetchRequest(entity: NutritionEntryEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \NutritionEntryEntity.date, ascending: false)]) var nutritionEntries: FetchedResults<NutritionEntryEntity>

    var body: some View {
        List(nutritionEntries, id: \.id) { entry in
            Text("Food: \(entry.foodName ?? "") Calories: \(entry.calories)")
        }
    }
}
