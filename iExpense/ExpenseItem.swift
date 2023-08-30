//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Dominique Strachan on 8/28/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
