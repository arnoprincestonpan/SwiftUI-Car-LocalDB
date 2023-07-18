//
//  ContentView.swift
//  SwiftUI-Car-LocalDB
//
//  Created by Arno Pan on 2023-07-17.
//

import SwiftUI

struct ContentView: View {
    let coreDataManager: CoreDataManager
    
    @State private var carYear: Int16?
    @State private var carModel: String = ""
    @State private var carBrand: String = ""
    @State private var carFuel: String = ""
    @State private var carBody: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    VStack{
                        Text("Year")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Year", value: $carYear, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("Body")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Body", text: $carBody)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    VStack{
                        Text("Brand")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Brand", text: $carBrand)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("Fuel")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Fuel", text: $carFuel)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                VStack {
                    Text("Model")
                    TextField("Model", text: $carModel)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        let intCarYear : Int? = Int(carYear)
                        
                    } label: {
                        Text("Save")
                    }
                }
            }.padding()
        }.navigationTitle("Cars")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDataManager: CoreDataManager())
    }
}
