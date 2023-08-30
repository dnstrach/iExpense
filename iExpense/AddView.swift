//
//  AddView.swift
//  iExpense
//
//  Created by Dominique Strachan on 8/28/23.
//

import SwiftUI

struct customizeAmount: ViewModifier {
    let expenseItem: ExpenseItem
    
    func body(content: Content) -> some View {
        switch expenseItem.amount {
        case 0..<10:
            content.foregroundColor(Color("Light"))
        case 10..<100:
            content
                .foregroundColor(Color("Mid"))
                .fontWeight(.semibold)
        default:
            content
                .foregroundColor(Color("Dark"))
                .fontWeight(.bold)
        }
        
    }
}

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
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
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

extension View {
    func amountStyle(for expenseItem: ExpenseItem) -> some View {
        modifier(customizeAmount(expenseItem: expenseItem))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
