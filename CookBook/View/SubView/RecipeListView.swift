//
//  RecipeListView.swift
//  CookBook
//
//  Created by pranavashok.patel on 20/02/26.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject var recipeVM: RecipeViewModel
    @StateObject var ingredientVM: IngredientViewModel
    
    @State private var showAddRecipeView: Bool = false
    
    var body: some View {
        List {
            ForEach(recipeVM.filteredRecipes) { recipe in
                NavigationLink {
                    RecipeDetailView(recipe: recipe)
                } label: {
                    VStack(alignment: .leading) {
                        Text(recipe.name ?? "Add name")
                            .font(.headline)
                        
                        Text("\(recipe.instructions ?? "")")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
            }
            .onDelete(perform: delete)
        }
        .searchable(text: $recipeVM.searchText)
        .navigationTitle("Recipes")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAddRecipeView.toggle()
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .sheet(isPresented: $showAddRecipeView) {
            AddRecipeView(viewModel: recipeVM,
                          ingredientViewModel: ingredientVM)
        }
    }
    
    func delete(at offsets: IndexSet) {
        offsets.map {recipeVM.recipes[$0]}
            .forEach(recipeVM.deleteRecipe(_:))
    }
}

#Preview {
//    RecipeListView(viewModel: RecipeViewModel(context: PersistenceController.preview.container.viewContext))
}
