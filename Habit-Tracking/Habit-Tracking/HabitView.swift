//
//  HabitView.swift
//  Habit-Tracking
//
//  Created by CHOIJUNHYUK on 6/9/24.
//

import SwiftUI

struct HabitView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var habit: HabitItem
    
    var body: some View {
        List {
            Text(habit.description)
            
            Stepper(value: $habit.finish, in: 0...100) {
                Text("Finish \(habit.finish)")
            }
        }
        .navigationTitle(habit.name)
    }
}

#Preview {
    HabitView(habit: Binding.constant(HabitItem(name: "Test Title", description: "Test Description")))
}
