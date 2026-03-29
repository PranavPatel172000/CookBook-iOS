//
//  ContentView.swift
//  CookBook
//
//  Created by pranavashok.patel on 20/02/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        RootTableView()
    }
    
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
