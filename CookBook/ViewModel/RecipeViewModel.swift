//
//  RecipeViewModel.swift
//  CookBook
//
//  Created by pranavashok.patel on 20/02/26.
//

import Foundation
import CoreData

@MainActor

class RecipeViewModel: ObservableObject {
    @Published var recipes: [RecipeEntity] = []
    @Published var ingredients: [IngredientEntity] = []
    
    @Published var searchText: String = ""
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchRecipes()
        fetchIngredients()
    }
    
    var filteredRecipes: [RecipeEntity] {
        guard !searchText.isEmpty else {
            return recipes
        }
        return recipes.filter { $0.name?.localizedStandardContains(searchText) ?? false }
    }
    
   func fetchRecipes() {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
       request.sortDescriptors = [NSSortDescriptor(keyPath: \RecipeEntity.name, ascending: true)]
       
       do {
           recipes = try context.fetch(request)
       } catch {
           print("Error while fetching recipes \(error.localizedDescription)")
       }
    }
    
    func fetchIngredients() {
         let request: NSFetchRequest<IngredientEntity> = IngredientEntity.fetchRequest()
        
        do {
            ingredients = try context.fetch(request)
            print("Ingredienta count \(ingredients.count)")
        } catch {
            print("Error while fetching Ingredients \(error.localizedDescription)")
        }
         
     }
    
    func addRecipe(name: String, instructions: String, selectedIngredients: [IngredientEntity]) {
        let recipe = RecipeEntity(context: context)
        recipe.id = UUID()
        recipe.name = name
        recipe.instructions = instructions
        
        selectedIngredients.forEach { ingredient in
            recipe.addToIngredients(ingredient)
        }
        
        save()
    }
    
    func deleteRecipe(_ recipe: RecipeEntity) {
        context.delete(recipe)
        save()
    }
    
    private func save() {
        do {
            try context.save()
            fetchRecipes()
        } catch {
            print("Error while saving recipes \(error.localizedDescription)")
        }
    }
}
