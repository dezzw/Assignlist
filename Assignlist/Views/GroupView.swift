//
//  GroupView.swift
//  Assignlist
//
//  Created by Desmond Wang on 2023-08-18.
//

import SwiftUI

struct GroupView: View {
    var body: some View {
        VStack {
            HStack {
                //label
                Image(systemName: "checkmark.circle")
                
                Spacer()
                
                Text("0")
                    .bold()
            }
            .font(.largeTitle)
            
            Text("CSC369H5")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 5)
                .bold()
        }
        .font(.title2)
        .frame(width: 200 ,height: 120)
        .padding(10)
        .background(.white)
        .cornerRadius(20)
//        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 20)
        
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
