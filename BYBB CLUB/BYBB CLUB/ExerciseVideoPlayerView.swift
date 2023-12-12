//
//  ExerciseVideoPlayerView.swift
//  BYBB CLUB
//
//  Created by Diego Rivera on 12/01/23.
//

import AVKit
import SwiftUI

struct ExerciseVideoPlayerView: View {
    let videoURL = URL(string: "https:instagram.com/@bybb.chandler")!
    @State private var isPlaying = false
    var body: some View {
            VideoPlayer(player: AVPlayer(url: videoURL)){
                        
               PlayPauseButton(isPlaying: $isPlaying)
                           
                CustomProgressView()
            
            
            VStack {
                
                Text("Workout tutorials")
            }
            .padding()
        }
        .onAppear {
            
            trackVideoView()
        }
    }
        
    func trackVideoView() {
        print("Video Viewed: \(videoURL)")
    }
}

struct PlayPauseButton: View {
    @Binding var isPlaying: Bool
    var body: some View {

        Button(action: {
                   isPlaying.toggle()
               }) {
                   Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: 40, height: 40)
                       .foregroundColor(.white)
        }
    }
}

struct CustomProgressView: View {
    var body: some View {
        
        Slider(value: .constant(0.5))
            .accentColor(.green)
    }
}
