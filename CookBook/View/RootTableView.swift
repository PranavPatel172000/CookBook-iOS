//
//  RootTableView.swift
//  CookBook
//
//  Created by pranavashok.patel on 20/02/26.
//

import SwiftUI

struct RootTableView: View {
    @StateObject private var recipeVM: RecipeViewModel = RecipeViewModel(context: PersistenceController.shared.container.viewContext)
    @StateObject private var ingredientVM: IngredientViewModel = IngredientViewModel(context: PersistenceController.shared.container.viewContext)
    
    var body: some View {
        TabView {
            NavigationStack {
                RecipeListView(recipeVM: recipeVM,
                               ingredientVM: ingredientVM)
            }
            .tabItem {
                Label("Recipes", systemImage: "book")
            }
            
            NavigationStack {
                IngredientListView(viewModel: ingredientVM)
            }
            .tabItem {
                Label("Ingredients", systemImage: "leaf")
            }
            
            NavigationStack {
                CookView(recipeVM: recipeVM,
                         ingredientVM: ingredientVM)
            }
            .tabItem {
                Label("Cook", systemImage: "flame")
            }
        }
    }
}

#Preview {
    RootTableView()
}
