//
//  HealthManager.swift
//  BYBB CLUB
//
//  Created by Diego Rivera on 11/14/23.
//

import Foundation
import HealthKit
import Firebase
import FirebaseFirestore

extension Date{
    static var startOfToday: Date {
        Calendar.current.startOfDay(for: Date())
    }
}

class HealthManager: ObservableObject{
    
    let healthStore = HKHealthStore()
    
    @Published var activities: [String : Activity] = [:]
    
    init(){
        let squats  = HKQuantityType(.physicalEffort)
        let calories = HKQuantityType(.activeEnergyBurned)
        
        let healthTypes: Set = [squats, calories]
        
        Task{
            do{
                try await healthStore.requestAuthorization(toShare:[], read: healthTypes)
                fetchTodaySquats()
                fetchTodayCalories()
            }catch{
                print("error accessing data")
            }
        }
    }
    
    func fetchTodaySquats(){
        let squats = HKQuantityType(.pushCount)
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfToday, end: Date())
        let query = HKStatisticsQuery(quantityType: squats, quantitySamplePredicate: predicate){ _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching squat data")
                return
            }
            
            let squatCount = quantity.doubleValue(for: .count())
            let activity = Activity(id: 0, title: "Todays squat", subtitle: "RPE", image: "figure.cross.training", amount: squatCount.formattedString())
            DispatchQueue.main.async {
                self.activities["Todays Squat"] = activity
            }
            
            print(squatCount.formattedString())
        }
        healthStore.execute(query)
    }
    func fetchTodayCalories(){
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfToday, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate){ _,result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching calorie data")
                return
                
            }
            let calorieCount = quantity.doubleValue(for: .kilocalorie())
            let activity = Activity(id: 1, title: "Todays calories", subtitle: "Goal: 900", image: ".flame", amount: calorieCount.formattedString())
            DispatchQueue.main.async {
                self.activities["TodaysCalories"] = activity
            }
            
            print(calorieCount.formattedString())
        }
        healthStore.execute(query)
        
    }
    
    struct Workout: Codable {
        let id: UUID
        let date: Date
        let exercise: String
        let sets: Int
        let reps: Int
        let weight: Double
    }
    
    func logWorkout(exercise: String, sets: Int, reps: Int, weight: Double) {
        let workout = Workout(id: UUID(), date: Date(), exercise: exercise, sets: sets, reps: reps, weight: weight)
        
        let db = Firestore.firestore()
        do{
            let workoutData = try Firestore.Encoder().encode(workout)
            _ = try db.collection("workouts").addDocument(data: workoutData)
        }catch{
            print("Error updating your workout numbers : \(error.localizedDescription)")
        }
        
    }
    
    func logWorkoutLocally(exercise: String, sets: Int, reps: Int, weight: Double) {
            let context = CoreDataStack.shared.viewContext
            let workout = WorkoutEntity(context: context)
            workout.id = UUID()
            workout.date = Date()
            workout.exercise = exercise
            workout.sets = Int16(sets)
            workout.reps = Int16(reps)
            workout.weight = weight

            CoreDataStack.shared.saveContext()
        }
    
    func logNutritionLocally(foodName: String, calories: Double) {
            let context = CoreDataStack.shared.viewContext
            let nutritionEntry = NutritionEntryEntity(context: context)
            nutritionEntry.id = UUID()
            nutritionEntry.date = Date()
            nutritionEntry.foodName = foodName
            nutritionEntry.calories = calories

            CoreDataStack.shared.saveContext()
        }

    
}

extension Double{
    func formattedString() -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
    
    
}
