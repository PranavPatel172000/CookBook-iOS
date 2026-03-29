//
//  MultipleSelectionRow.swift
//  CookBook
//
//  Created by pranavashok.patel on 20/02/26.
//

import SwiftUI

struct MultipleSelectionRow: View {
    let ingredient: IngredientEntity
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(ingredient.name ?? "")
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

#Preview {
    //let context = PersistenceController.preview.container.viewContext
}
