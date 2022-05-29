//
//  ContentView.swift
//  Shared
//
//  Created by Herie Marie A. Estaño on 4/14/22.
//

import SwiftUI


struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: []) private var todosCD: FetchedResults<ToDoCD>
    
    @State private var showAddTodoView = false
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    List {
                        // ForEach(todos, id:\.name) { (todo) in
                        ForEach(todosCD, id: \.self) { (todo) in
                            NavigationLink(destination: DetailView(detailView: todo))
                                {
                                HStack {
                                    Image(todo.category ?? "blank")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    
                                    Text(todo.name ?? "untitled")
                                }//:HSTACK
                            }//:SUPPOSEDLY LABEL UNDER NAVIGATIONLINK
                        }//:FOREACH
                        .onDelete(perform: { indexSet in
                            deleteTodo(offsets: indexSet)
                        })
                    }//:LIST
                    // .listRowBackground(Color.pink)
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                    .transition(.move(edge: .bottom))
                    .animation(.easeOut(duration: 0.5))
                    .navigationBarTitle("Todo Items", displayMode: .inline)
                    .navigationBarItems(leading: Button (
                                            //  action: { addTodo() },
                                            action: { self.showAddTodoView.toggle() },
                                            label: { Image(systemName: "plus") })
                                            .sheet(isPresented: $showAddTodoView) {
                                                AddTodoView(showAddTodoView: self.$showAddTodoView)
                                            }
                                        
                                        , trailing: EditButton())
                }//:VSTACK
            }//:ZSTACK
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .background(
              ScreenBackground()
            ).ignoresSafeArea(.all)
        }//:NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
    

    // MARK: - CORE DATA FUNCTION
    
    private func deleteTodo(offsets: IndexSet) {
        for index in offsets {
            let todo = todosCD[index]
            viewContext.delete(todo)
        }
        
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolved error: \(error)")
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
