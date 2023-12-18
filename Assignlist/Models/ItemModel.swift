//
//  ItemModel.swift
//  Assignlist
//
//  Created by Desmond Wang on 2023-08-18.
//

import Foundation

// Immutable Struct
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let label: String
    let isCompleted: Bool
    let dueDate: Date
    
    init(id: String = UUID().uuidString, title: String, label: String = "default", isCompleted: Bool, dueDate: Date) {
        self.id = id
        self.title = title
        self.label = label
        self.isCompleted = isCompleted
        self.dueDate = dueDate
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, dueDate: Date())
    }
}
