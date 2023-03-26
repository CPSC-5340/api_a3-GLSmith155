//
//  NameAgeView.swift
//  Assignment3
//
//  Created by user225812 on 3/26/23.
//

import SwiftUI

struct NameAgeView: View {
    @ObservedObject var viewModel: NameViewModel
    let name: String

    var body: some View {
        VStack {
            if let age = viewModel.age {
                Text("The likely age of someone named \(name) is \(age).")
                    .font(.title)
                    .padding()
            } else {
                ProgressView()
                    .scaleEffect(2)
                    .padding()
            }
        }
        .navigationTitle(name)
        .onAppear {
            viewModel.fetchAge(for: name)
        }
    }
}
