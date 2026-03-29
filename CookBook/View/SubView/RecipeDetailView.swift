//
//  RecipeDetailView.swift
//  CookBook
//
//  Created by pranavashok.patel on 20/02/26.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: RecipeEntity
    
    var body: some View {
        List {
            Section {
                Text(recipe.instructions ?? "")
            } header: {
                Text("Instructions")
            }
            
            Section {
                ForEach(recipeIngredients, id: \.self) { ingredient in
                    Text(ingredient.name ?? "")
                }
            } header: {
                Text("Ingredients")
            }


        }
    }
    
    private var recipeIngredients: [IngredientEntity] {
        let set = recipe.ingredients as? Set<IngredientEntity> ?? []
        return set.sorted { $0.name ?? "" < $1.name ?? ""}
    }
}

#Preview {
    //RecipeDetailView(recipe: <#RecipeEntity#>)
}
