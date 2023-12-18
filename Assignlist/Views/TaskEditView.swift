//
//  TaskEditView.swift
//  Assignlist
//
//  Created by Desmond Wang on 2023-08-31.
//


import SwiftUI

struct TaskEditView: View
{
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    //    @EnvironmentObject var dateHolder: DateHolder
    
    @State var title: String = ""
    @State var dueDate: Date = Date()
    
    var body: some View
    {
        Form
        {
            Section(header: Text("Task"))
            {
                TextField("Task Name", text: $title)
            }
            
            Section(header: Text("Label"))
            {
                
            }
            
            Section(header: Text("Due Date"))
            {
                DatePicker("Due Date", selection: $dueDate, displayedComponents: [.hourAndMinute, .date])
            }
            
            Section()
            {
                Button(action: saveAction, label: {
                    Text("Save".uppercased())
                        .foregroundColor(Color.accentColor)
                        .font(.headline)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                })
            }
        }
    }
    
    func saveAction()
    {
        withAnimation
        {
            
            listViewModel.addItem(title: title, dueDate: dueDate)
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct TaskEditView_Previews: PreviewProvider
{
    static var previews: some View {
        NavigationView {
            TaskEditView()
        }
        .environmentObject(ListViewModel())    }
}
