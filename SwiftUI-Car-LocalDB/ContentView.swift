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
    @State private var cars: [Car] = [Car]()
    
    private func populateCars() {
        cars = coreDataManager.getAllCars()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Car")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
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
                    .padding()
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
                    .padding()
                }
                VStack {
                    Text("Model")
                        .padding()
                    TextField("Model", text: $carModel)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button {
                        let intCarYear : Int? = Int(carYear!)
                        coreDataManager.saveCar(year: intCarYear!, brand: carBrand, model: carModel, fuel: carFuel, body: carBody)
                        populateCars()
                    } label: {
                        Text("Save")
                    }
                    .padding()
                }
                List {
                    ForEach(cars, id:\.self){ car in 
                        HStack {
                            Text("\(car.year)")
                            Spacer()
                            Text(car.brand ?? "")
                            Spacer()
                            Text(car.model ?? "")
                            Spacer()
                            Text(car.body ?? "")
                            Spacer()
                            Text(car.fuel ?? "")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach({ index in
                            let car = cars[index]
                            coreDataManager.deleteCar(car: car)
                            populateCars()
                        })
                    })
                }
                Spacer()
            }
            .background(Color("lightGray"))
        }.navigationTitle("Cars")
            .onAppear(perform: {
                populateCars()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDataManager: CoreDataManager())
    }
}
