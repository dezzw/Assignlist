//
//  CountdownView.swift
//  Assignlist
//
//  Created by Desmond Wang on 2023-08-09.
//

import SwiftUI

struct CountdownView: View {
    
    @State var totalCountdown: CGFloat  = 30
    @State var counter: Int = 10
    
    var body: some View {
        ZStack {
            progressTrackView()
            progressBarView()
            progressTimeView()
        }
    }
    
    func progressTrackView() -> some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 50, height: 50)
            .overlay(
                Circle()
                    .stroke(Color.black.opacity(0.09), lineWidth: 5)
            )
    }
    
    func progressBarView() -> some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 50, height: 50)
            .overlay(
                Circle()
                    .trim(from: 0, to: startProgress())
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.init(degrees: -90))
                    .foregroundColor(
                        withAnimation(.easeInOut(duration: 0.2)) {
                            completeProgress() ? Color.green : Color.orange
                        }
                    )
                
            )
    }
    
    func startProgress() -> CGFloat {
        return CGFloat(counter) / CGFloat(totalCountdown)
    }
    
    func completeProgress() -> Bool {
        return startProgress() == 1
    }
    
    func counterToMinutes() -> String {
        let currentTime = Int(totalCountdown) - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
    
    // 进度时间
    func progressTimeView()-> some View {
        Text(counterToMinutes())
            .font(.system(size: 14))
            .fontWeight(.black)
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
