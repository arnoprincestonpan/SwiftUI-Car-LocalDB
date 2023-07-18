//
//  CoreDataManager.swift
//  SwiftUI-Car-LocalDB
//
//  Created by Arno Pan on 2023-07-17.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init(){
        persistentContainer = NSPersistentContainer(name: "CarModel")
        
        persistentContainer.loadPersistentStores {
            (description, error) in
            if let err = error {
                fatalError("Core data store failed: \(err.localizedDescription)")
            }
        }
    }
    
    func saveCar(year: Int, brand: String, model : String = "", fuel : String = "", body : String = ""){
        let car = Car(context: persistentContainer.viewContext)
        car.year = Int16(year)
        car.brand = brand
        car.model = model
        car.fuel = fuel
        car.body = body
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save car \(error)")
        }
    }
    
    func getAllCars() -> [Car] {
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func deleteCar(car: Car) {
        persistentContainer.viewContext.delete(car)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete car \(error).")
        }
    }
    
    func updateCar() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to update car \(error)")
        }
    }
    
}
