//
//  HomeView.swift
//  BYBB CLUB
//
//  Created by Diego Rivera on 11/14/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: HealthManager
    let welcomeArray = ["welcome", "Hola", "Hi"]
    @State private var currentIndex = 2
    
    var body: some View {
        VStack{
            Text(welcomeArray[currentIndex])
                .font(.largeTitle)
                .padding()
                .foregroundColor(.secondary)
                .animation(.easeInOut(duration: 1), value: currentIndex)
                .onAppear{
                    startWelcomeTimer()
                }
            LazyVGrid(columns: Array(repeating: GridItem(spacing:20), count: 2)) {
                ForEach(manager.activities.sorted(by: {$0.value.id < $1.value.id}), id: \.key) { item in
                    TrainingCard(activity: item.value)
                        .padding()
                }
            }
            .padding(.horizontal)
        }
        .frame (maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
    }
    func startWelcomeTimer(){
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true){ _ in
            withAnimation{
            currentIndex = (currentIndex + 1) % welcomeArray.count
            }
            
        }
    }
}
 
    struct HomeView_Previews: PreviewProvider{
        static var previews: some View{
            HomeView()
                .environmentObject(HealthManager())
        }
    }
 
