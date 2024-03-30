//
//  TLButton.swift
//  ToDoList
//
//  Created by Alexandre Laborde on 28/03/2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        }
    label: {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(background)
            Text(title)
                .foregroundColor(.white)
                .bold()
        }
    }
    .padding()
    }
    
}

#Preview {
    TLButton(title: "Title", background: .blue) {
        //Action
    }
}
