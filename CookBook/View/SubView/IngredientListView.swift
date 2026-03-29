//
//  IngredientListView.swift
//  CookBook
//
//  Created by pranavashok.patel on 20/02/26.
//

import SwiftUI
import CoreData

struct IngredientListView: View {
    
    @StateObject var viewModel: IngredientViewModel 
    
    @State private var showAddIngredientView: Bool = false
    
    var body: some View {
        List {
            ForEach(viewModel.ingredients) { ingredient in
                VStack(alignment: .leading) {
                    Text(ingredient.name ?? "Add name")
                        .font(.headline)
                    
                    Text("in \(ingredient.measurementUnit ?? "")")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
               }
            }
            .onDelete(perform: deleteIngredient)
        }
        .navigationTitle("Ingredients")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAddIngredientView.toggle()
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .sheet(isPresented: $showAddIngredientView) {
            AddIngredientView(viewModel: viewModel)
        }
    }
    
    func deleteIngredient(offsets: IndexSet) {
        offsets.map{viewModel.ingredients[$0]}
            .forEach {
                viewModel.deleteIngredient($0)
            }
        
    }
}

#Preview {
    NavigationStack {
        IngredientListView(viewModel: IngredientViewModel(context: PersistenceController.preview.container.viewContext))
    }
}
