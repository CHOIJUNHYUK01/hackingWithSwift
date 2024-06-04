//
//  ContentView.swift
//  iExpense
//
//  Created by CHOIJUNHYUK on 5/23/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expense {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expense()
    @State private var showingAddExpense = false
    @State private var select = "Entries"
    
    let selectTypes = ["Entries", "Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            
            List {
                Section {
                    Picker("Type", selection: $select) {
                        ForEach(selectTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .listRowSeparator(.hidden)
                
                ForEach(filterExpenseList(select)) { expense in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline.bold())
                            Text(expense.type)
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Text(formatAsCurrency(expense.amount))
                    }
                    .padding()
                    .listRowSeparator(.hidden)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(expenseColor(amount: expense.amount), lineWidth: 1.0)
                    )
                }
                .onDelete(perform: { indexSet in
                    removeItem(at: indexSet, selectType: select)
                })
                
            }
            .listStyle(.plain)
            .navigationTitle("Expenses")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: expenses)
            })
        }
    }
    
    func removeItem(at offsets: IndexSet, selectType: String) {
        switch selectType {
        case "Personal":
            let personalItems = expenses.items.enumerated().filter { $0.element.type == "Personal" }
            for index in offsets {
                let actualIndex = personalItems[index].offset
                expenses.items.remove(at: actualIndex)
            }
            return
        case "Business":
            let businessItems = expenses.items.enumerated().filter { $0.element.type == "Business" }
            for index in offsets {
                let actualIndex = businessItems[index].offset
                expenses.items.remove(at: actualIndex)
            }
            return
        default:
            expenses.items.remove(atOffsets: offsets)
        }
    }
    
    func formatAsCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = Locale.current.currencySymbol ?? "$"
        formatter.maximumFractionDigits = 2
        
        if let formattedString = formatter.string(from: NSNumber(value: value)) {
            return formattedString
        } else {
            return "$0"
        }
    }
    
    func filterExpenseList(_ selectType: String) -> [ExpenseItem] {
        switch selectType {
        case "Personal":
            return expenses.items.filter { $0.type == "Personal" }
        case "Business":
            return expenses.items.filter { $0.type == "Business" }
        default:
            return expenses.items
        }
    }
    
    func expenseColor(amount: Double) -> Color {
        switch amount {
        case 0..<10000:
            return Color.green
        case 10000..<100_000:
            return Color.orange
        default:
            return Color.red
        }
    }
}

#Preview {
    ContentView()
}
