//
//  AddActivity.swift
//  Habit Tracker
//
//  Created by Jan Sulejmani on 3/31/23.
//

import SwiftUI

struct AddActivity: View {
    
    @State private var name = ""
    @State private var description = ""
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            
            Form{
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add Activity")
            .navigationBarItems(trailing:
                Button("Save"){
                    if self.name != "" && self.description != ""{
                        let activity = Activity(name: name, description: description, count: 0)
                        self.activities.activities.append(activity)
                        self.presentationMode.wrappedValue.dismiss()
                    }else{
                        self.showingAlert.toggle()
                    }
                }
            )
        }
        .alert(isPresented: $showingAlert){
            Alert(title: Text("Error"), message: Text("Please enter an activity and its description."), dismissButton: .default(Text("OK")))
        }
    }
}

