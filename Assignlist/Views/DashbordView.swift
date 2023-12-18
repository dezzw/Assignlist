//
//  DashbordView.swift
//  Assignlist
//
//  Created by Desmond Wang on 2023-08-18.
//

import SwiftUI

struct DashbordView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            
            VStack {
                HStack {
                    Text("Today")
                        .bold()
                    
                    Spacer()
                    
                    Text("0")
                        .font(.largeTitle)
                        .bold()
                        .padding(.trailing, 10)
                }
                .font(.largeTitle)
                .padding(.horizontal, 10)
                .padding(.top, 20)
                
                Text("\(Date().formatted(date: .long, time: .omitted))")
                    .frame(maxWidth: .infinity ,alignment: .leading)
                    .font(.title)
                    .bold()
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .padding(.bottom, 20)
                
            }
            .font(.title3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.3), radius: 30, x: 5, y: 20)
            .padding(.horizontal, 20)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    GroupView()
                    GroupView()
                    GroupView()
                    GroupView()
                    GroupView()
                }
            }
            .padding(.horizontal, 20)
            .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 20)
            
            ScrollView(showsIndicators: false) {
                List {
                    ForEach(listViewModel.items) { item in
                        CardView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
                
            }
            .frame(maxWidth: .infinity)
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Image(systemName: "ellipsis.circle")
                    .foregroundColor(Color.accentColor)
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color.accentColor)
                    Text("New Reminder")
                        .foregroundColor(Color.accentColor)
                        .bold()
                }
                
                HStack {
                    Text("Add List")
                        .foregroundColor(Color.accentColor)
                        .bold()
                }
            }
        }
    }
}

struct DashbordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DashbordView()
        }
        .environmentObject(ListViewModel())
    }
}
