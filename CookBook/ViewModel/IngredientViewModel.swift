//
//  IngredientViewModel.swift
//  CookBook
//
//  Created by pranavashok.patel on 20/02/26.
//

import Foundation
import CoreData

@MainActor
class IngredientViewModel: ObservableObject {

    @Published var ingredients: [IngredientEntity] = []
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
        fetchIngredients()
    }
    
    func fetchIngredients() {
        let request: NSFetchRequest<IngredientEntity> = IngredientEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \IngredientEntity.name, ascending: true)]
        
        do {
            ingredients = try context.fetch(request)
        } catch {
            print("Error while fetching all ingredients: \(error)")
        }
    }
    
    func addIngredient(name: String, unit: String) {
        let ingredient = IngredientEntity(context: context)
        ingredient.id = UUID()
        ingredient.name = name
        ingredient.measurementUnit = unit
        
        save()
    }
    
    func deleteIngredient(_ ingredient: IngredientEntity) {
        context.delete(ingredient)
        save()
    }
    
    func save() {
        do {
            try context.save()
            fetchIngredients()
        } catch {
           print("Error while saving ingredient: \(error)")
        }
    }
}
