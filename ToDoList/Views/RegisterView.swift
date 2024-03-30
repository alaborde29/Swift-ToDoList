//
//  RegisterView.swift
//  ToDoList
//
//  Created by Alexandre Laborde on 15/03/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "Register", subtitle: "It starts here", angle: 15, color: Color.yellow)
                //Login Form
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .offset(y: -50)
                        .multilineTextAlignment(.center)
                }
                
                Form {
                    TextField("Nom complet", text: $viewModel.fullName)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    TextField("Adresse email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Mot de passe", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "Create Acoount", background: .blue) {
                        viewModel.register()
                    }
                }
                .offset(y: -50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterView()
}
