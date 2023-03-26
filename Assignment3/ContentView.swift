//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NameViewModel()
    @State private var showingAddNameView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.names) { name in
                    NavigationLink(destination: NameAgeView(viewModel: NameViewModel(), name: name.name)) {
                        Text(name.name)
                    }
                }
                .onDelete(perform: viewModel.removeName)
            }
            .navigationTitle("Agify Name API")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddNameView = true
                    }) {
                        Label("Add Name", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddNameView) {
                AddNameView(viewModel: viewModel)
            }
        }
        .background(Color(red: 1.0, green: 0.9, blue: 0.8).ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
