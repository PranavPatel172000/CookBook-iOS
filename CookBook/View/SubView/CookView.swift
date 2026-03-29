//
//  CookView.swift
//  CookBook
//
//  Created by pranavashok.patel on 20/02/26.
//

import SwiftUI

struct CookView: View {
    @ObservedObject var recipeVM: RecipeViewModel
    @ObservedObject var ingredientVM: IngredientViewModel
    
    @State private var selectedIngredients: Set<IngredientEntity> = []
    
    var body: some View {
        List {
            // MARK: Ingredient selection
            Section {
                ForEach(ingredientVM.ingredients) { ingredient in
                    MultipleSelectionRow(ingredient: ingredient,
                                         isSelected: selectedIngredients.contains(ingredient)) {
                        if selectedIngredients.contains(ingredient) {
                            selectedIngredients.remove(ingredient)
                        } else {
                            selectedIngredients.insert(ingredient)
                        }
                    }
                }
            } header: {
                Text("Select Ingredients")
            }
            
            // MARK: Matching recipes
            Section {
                ForEach(filteredRecipes) { recipe in
                    Text(recipe.name ?? "")
                }
            } header: {
                Text("Recipes you can cook")
            }


        }
        .navigationTitle("Cook")
    }
    
    var filteredRecipes: [RecipeEntity] {
        guard !selectedIngredients.isEmpty else {
            return recipeVM.recipes
        }
        
        return recipeVM.recipes.filter { recipe in
            let recipeIngredients = recipe.ingredients as? Set<IngredientEntity> ?? []
            return selectedIngredients.allSatisfy { recipeIngredients.contains($0)}
        }
    }
}

#Preview {
    //CookView(recipeVM: <#RecipeViewModel#>, ingredientVM: <#IngredientViewModel#>)
}
