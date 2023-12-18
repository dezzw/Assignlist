//
//  CardView.swift
//  Assignlist
//
//  Created by Desmond Wang on 2023-08-09.
//

import SwiftUI

struct CardView: View {
    
    let item: ItemModel
   
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 8)
                .cornerRadius(10)
                .foregroundColor(.blue)
                .padding(10)
            
            VStack {
                // Title
                Text(item.title)
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity ,alignment: .leading)
                
                Spacer()
                // Course title
                Text(item.label)
                    .foregroundColor(.gray)
                    .italic()
                    .frame(maxWidth: .infinity ,alignment: .leading)
                Spacer()
                
                // due date
                Text("Due: \(item.dueDate.formatted(date: .abbreviated, time: .omitted))")
                    .frame(maxWidth: .infinity ,alignment: .leading)
            }
            .padding(.vertical, 14)
            
            Spacer()
            CountdownView()
                .padding(20)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 20)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Assignment 1", label: "CSC369H5", isCompleted: false, dueDate: Date())
    static var item2 = ItemModel(title: "Assignment 2", label: "CSC301H5", isCompleted: false, dueDate: Date())
    static var previews: some View {
        Group {
            CardView(item: item1)
            CardView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
