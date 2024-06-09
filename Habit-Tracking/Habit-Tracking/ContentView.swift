//
//  ContentView.swift
//  Habit-Tracking
//
//  Created by CHOIJUNHYUK on 6/9/24.
//

import SwiftUI

struct HabitItem: Identifiable, Codable, Hashable {
    var id = UUID()
    let name: String
    let description: String
    var finish = 0
}

@Observable
class Habit {
    var items = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    @State private var habits = Habit()
    @State private var showAddView = false
    @State private var habitTitle = ""
    @State private var habitDescription = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits.items) { item in
                    NavigationLink(value: item) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.title.bold())
                                Text(item.description)
                                    .font(.subheadline)
                            }
                            Spacer()
                            HStack {
                                Text("\(item.finish)")
                                    .font(.title.bold())
                                if item.finish <= 1 {
                                    Text("time")
                                        .font(.subheadline)
                                } else {
                                    Text("times")
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    showAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddView, content: {
                NavigationStack {
                    List {
                        Section {
                            TextField("Habit Title", text: $habitTitle)
                            TextField("Habit Description", text: $habitDescription)
                        }
                        
                        Section {
                            Button {
                                habits.items.append(HabitItem(name: habitTitle, description: habitDescription))
                                habitTitle = ""
                                habitDescription = ""
                                showAddView = false
                            } label: {
                                Text("Add Habit")
                            }
                        }
                    }
                    .navigationTitle("Add Habit")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        Button {
                            habitTitle = ""
                            habitDescription = ""
                            showAddView = false
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
            })
            .navigationDestination(for: HabitItem.self) { habitItem in
                HabitView(habit: selectHabitItem(id: habitItem.id))
            }
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
    
    func selectHabitItem(id: UUID) -> Binding<HabitItem> {
        guard let index = self.habits.items.firstIndex(where: { $0.id == id }) else {
            fatalError("This Item is not Exist")
        }
        
        return $habits.items[index]
    }
}

#Preview {
    ContentView()
}
