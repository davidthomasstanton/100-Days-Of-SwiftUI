//
//  EnumLoading_.swift
//  BucketList
//
//  Created by David Stanton on 4/5/24.
//

import SwiftUI

struct MoodHappyView: View {
    var body: some View {
        Text("😀")
            .font(.system(size: 300))
    }
}
struct MoodMurrView: View {
    var body: some View {
        Text("🫤")
            .font(.system(size: 300))
    }
}

struct MoodRockView: View {
    var body: some View {
        Text("🪨")
            .font(.system(size: 300))
    }
}

struct EnumLoading_: View {
    enum MoodState: CaseIterable {
        case happy, murr, rock
    }
    
    @State private var moodState = MoodState.happy
    var body: some View {
        
        switch moodState {
        case .happy:
            MoodHappyView()
        case .murr:
            MoodMurrView()
        case .rock:
            MoodRockView()
        }
        
        Button("Randomize Mood") {
            moodState = MoodState.allCases.randomElement()!
        }
    }
}

#Preview {
    EnumLoading_()
}
