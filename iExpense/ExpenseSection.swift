//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Dominique Strachan on 8/28/23.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expense: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section(expense == [] ? "" : title) {
            ForEach(expense) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: "USD"))
                        .amountStyle(for: item)
                    
                }
            }
            .onDelete(perform: deleteItems)
            
        }
        
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Test", expense: [], deleteItems: { _ in })
    }
}
