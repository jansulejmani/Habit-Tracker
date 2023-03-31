//
//  ActivityDetailView.swift
//  Habit Tracker
//
//  Created by Jan Sulejmani on 3/31/23.
//

import SwiftUI

struct ActivityDetailView: View {
    
    @ObservedObject var activities: Activities
    var index: Int
    
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                Text("Activity Description: \(self.activities.activities[index].description)")
                Text("Completion Count: \(self.activities.activities[index].count)")
                    .font(.headline)
                    .padding(.all, 10)
                
                Button("Increment Counter"){
                    var count = self.activities.activities[index].count
                    count += 1
                    self.activities.activities[index].count = count
                }
                Spacer()
            }
            .padding(.horizontal, 10)
        }
        .navigationBarTitle(Text(self.activities.activities[index].name), displayMode: .inline)
    }
}

