//
//  HeaderView.swift
//  ToDoList
//
//  Created by Alexandre Laborde on 15/03/2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let color: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size:30))
                    .foregroundColor(.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -200)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, color: Color.blue)
}
