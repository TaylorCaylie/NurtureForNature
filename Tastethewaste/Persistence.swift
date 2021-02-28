//
//  PersistenceController.swift
//  Tastethewaste
//
//  Created by Caylie Taylor on 2/28/21.
//

import Foundation
import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "Model")
    
    
    container.loadPersistentStores{ (storeDescription, error) in
    if let error = error as NSError? {
        fatalError("Unresolved error: \(error)")
            }
        }
    }

}
