//
//  AddNameView.swift
//  Assignment3
//
//  Created by user225812 on 3/26/23.
//

import SwiftUI

struct AddNameView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: NameViewModel
    @State private var name: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter a name", text: $name)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    viewModel.addName(name)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add Name")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Add Name")
        }
    }
}

