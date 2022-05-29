//
//  AddTodoView.swift
//  SimpleToDoApp
//
//  Created by Herie Marie A. Estaño on 4/14/22.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var showAddTodoView: Bool
   // @Binding var todos: [Todo]
    
    @State private var name: String = ""
    @State private var selectedCategory = 0
    
    var categoryTypes = ["family", "personal", "work"]
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                ScreenBackground()
                
                VStack {

// MARK: - TextField
                    
                    TextField("Type here...", text: $name)
                       // .textFieldStyle(RoundedBorderTextFieldStyle())
                       // .border(Color.black)
                        .padding()
                        .border(Color.black)
                        .background(Color.white
                                       // .opacity(0.3)
                                        .cornerRadius(10))
                        .foregroundColor(Color(.black))
                        .font(.title3)
                        .padding(.top, 20)
                     
// MARK: - Form
                    Form {
                       // Section {
                            VStack {
                                Text("Select Category")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Picker("", selection: $selectedCategory) {
                                    ForEach(0..<categoryTypes.count) {
                                        Text(self.categoryTypes[$0])
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                                .background(Color(.systemBlue))
                                
                                
                                Image(categoryTypes[selectedCategory])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150, alignment: .center)
                                
                            }//:VSTACK
                     //   }//:SECTION
                    }//:FORM
                    .padding(.top, 35)
                    .cornerRadius(15)
                   
                    
                   
// MARK: - BUTTON
                    Button(action: {
                        self.showAddTodoView = false
                        
                        let newTodoCD = ToDoCD(context: viewContext)
                        newTodoCD.name = name
                        newTodoCD.category = categoryTypes[selectedCategory]
                        
                        if textIsMoreThanFive() {
                            saveToDo()
                        }
                        
                    }, label: {
                        Text("Save".uppercased())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(textIsMoreThanFive() ? Color(.systemBlue) : Color(.systemGray))
                            .cornerRadius(10)
                            .foregroundColor(Color(.white))
                            .font(.title3)
                    }).padding(.bottom, 50)
                }//:VSTACK
                .padding()
            }//: ZSTACK
            .navigationTitle("TooDoooh :) ")
        }//: NAVIGATION
    }
    
    
    // MARK: - TEXT REQUIREMENT FUNCTION
    
    func textIsMoreThanFive() -> Bool {
        if name.count >= 5 {
            return true
        }
        return false
    }
    
    // MARK: - CORE DATA FUNCTION
    func saveToDo() {
       // todos.append(Todo(name: name, category: categoryTypes[selectedCategory] ))
        
        do{
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolved error: \(error)")
        }
    }
    
}


//struct AddTodoView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTodoView(showAddTodoView: <#Binding<Bool>#>, todos: <#Binding<[Todo]>#>)
//    }
//}




