//
//  AddView.swift
//  iExpense
//
//  Created by CHOIJUNHYUK on 5/30/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    var expenses: Expense
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        expenses.items.append(ExpenseItem(name: name, type: type, amount: amount))
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AddView(expenses: Expense())
}
