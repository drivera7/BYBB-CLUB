//
//  BybbTabView.swift
//  BYBB CLUB
//
//  Created by Diego Rivera on 11/14/23.
//

import SwiftUI

struct BybbTabView: View {
    @EnvironmentObject var manager: HealthManager
    @State var selectedTab = "Home"
    var body: some View {
        TabView(selection:$selectedTab){
            HomeView()
                .tag("Home")
                .tabItem{
                    Image(systemName: "house")
                }
            NavigationView{
                WorkoutEntryView()
            }
            .tabItem {
                Label("Log Workout", systemImage: "plus.square")
            }
            
            ProgressView()
                            .tabItem {
                                Label("Progress", systemImage: "chart.bar.fill")
                            }
            
                .environmentObject(manager)
            ContentView()
                .tag("Content")
                .tabItem{
                    Image(systemName: "person")
                }
        }
    }
}

struct BybbTabView_Previews: PreviewProvider{
    static var previews: some View{
        BybbTabView()
    }
}
