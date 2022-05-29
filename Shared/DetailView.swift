//
//  DetailView.swift
//  SimpleToDoApp
//
//  Created by Herie Marie A. Estaño on 4/16/22.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var detailView: ToDoCD
    @State var newName = ""
    
    var body: some View {
        
        ZStack {
            ScreenBackground()
            VStack {
                Text(detailView.name ?? "untitled")
                    .font(.title2)
                    .fontWeight(.bold)
                    .kerning(2.0)
                
                Image(detailView.category ?? "blank for now")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
            }//:VSTACK
            .onLongPressGesture(perform: { updateTodo(todo: detailView) })
        }//:ZSTACK
    }
    
    // MARK: - CORE DATA FUNCTION
    
    private func updateTodo(todo: FetchedResults<ToDoCD>.Element) {
        todo.name = "Read the bible"
        
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolved error: \(error)")
        }
        
    }
    
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(detailView: )
//    }
//}
