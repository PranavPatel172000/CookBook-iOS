//
//  AddRecipeView.swift
//  CookBook
//
//  Created by pranavashok.patel on 20/02/26.
//

import SwiftUI

struct AddRecipeView: View {
    @ObservedObject var viewModel: RecipeViewModel
    @ObservedObject var ingredientViewModel: IngredientViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var instructions: String = ""
    @State private var selectedIngredients: Set<IngredientEntity> = []
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Instructions", text: $instructions)
                } header: {
                    Text("Recipe Info")
                }
                
                Section {
                    ForEach(ingredientViewModel.ingredients) { ingredient in
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
            }
            .navigationTitle("Add Recipe")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.addRecipe(name: name,
                                            instructions: instructions,
                                            selectedIngredients: Array(selectedIngredients))
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                    .disabled(name.isEmpty || instructions.isEmpty ? true : false )
                }
            }
        }
    }
}

#Preview {
//    AddRecipeView(viewModel: RecipeViewModel(context: PersistenceController.preview.container.viewContext))
}
