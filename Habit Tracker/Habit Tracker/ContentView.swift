//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Jan Sulejmani on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var activities = Activities()
    @State private var showingAddActivityView = false
    
    var body: some View {
        NavigationView{
            
            List(0..<activities.activities.count, id: \.self){ index in
                
                NavigationLink(destination: ActivityDetailView(activities: self.activities, index: index)){
                    HStack{
                        VStack(alignment: .leading){
                            Text(self.activities.activities[index].name)
                                .font(.headline)
                            Text(self.activities.activities[index].description)
                        }
                        Spacer()
                        
                        Text("\(self.activities.activities[index].count)")
                    }
                }
                
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(trailing:
                Button(action: {
                self.showingAddActivityView = true
            }, label: {
                Image(systemName: "plus")
            })
            ).sheet(isPresented: $showingAddActivityView){
                AddActivity(activities: self.activities)
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
