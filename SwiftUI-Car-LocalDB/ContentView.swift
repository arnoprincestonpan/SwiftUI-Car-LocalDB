//
//  ContentView.swift
//  SwiftUI-Car-LocalDB
//
//  Created by Arno Pan on 2023-07-17.
//

import SwiftUI

struct ContentView: View {
    let coreDataManager: CoreDataManager
    
    @State private var carYear: Int16 = ""
    @State private var carBrand: String = ""
    @State private var carModel: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
