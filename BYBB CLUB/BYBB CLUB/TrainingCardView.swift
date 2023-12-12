//
//  TrainingCardView.swift
//  BYBB CLUB
//
//  Created by Diego Rivera on 11/14/23.
//

import SwiftUI

struct Activity{
    let id: Int
    let title: String
    let subtitle: String
    let image: String
    let amount: String
}


struct TrainingCard: View {
    @State var activity: Activity
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            VStack(spacing: 10) {
                HStack(alignment: .top){
                    VStack(alignment: .leading, spacing: 5) {
                        Text(activity.title)
                            .font(.system(size: 16))
                        Text(activity.subtitle)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Image(systemName: activity.image)
                        .foregroundColor(.blue)
                }
                .padding()
                
                Text(activity.amount)
                    .font(.system(size: 24))
            }
            .padding()
        .cornerRadius(15)
        }
    }
}

struct TrainingCard_Preview: PreviewProvider{
    static var previews: some View{
        TrainingCard(activity: Activity(id: 0, title:"Squats", subtitle: "RPE", image:"figure.cross.training", amount:  " 9 "))
    }
}
