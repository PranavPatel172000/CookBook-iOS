//
//  AddIngredientView.swift
//  CookBook
//
//  Created by pranavashok.patel on 20/02/26.
//

import SwiftUI

struct AddIngredientView: View {
    
    @ObservedObject var viewModel: IngredientViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var unit: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Unit", text: $unit)
                } header: {
                    Text("Ingredients Details")
                }
            }
            .navigationTitle("Add Ingredients")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addIngredient()
                    } label: {
                        Text("Save")
                    }
                    .disabled(name.isEmpty || unit.isEmpty ? true : false )
                }
            }
        }
    }
    
    private func addIngredient() {
        viewModel.addIngredient(name: name, unit: unit)
        dismiss()
    }
}

#Preview {
    AddIngredientView(viewModel: IngredientViewModel(context: PersistenceController.preview.container.viewContext))
}
