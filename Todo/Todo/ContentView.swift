//
//  ContentView.swift
//  Todo
//
//  Created by Kennedy Cambra-Cho on 11/21/20.
//
import Amplify
import AmplifyPlugins
import SwiftUI
//updates if any changes made to model
import Combine



struct ContentView: View {
    
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                self.performOnAppear()
        }
    }
//    updates with todo model
//    add memeber variable
    @State var todoSubscription: AnyCancellable?
    
    func subscribeTodos() {
       self.todoSubscription
           = Amplify.DataStore.publisher(for: Todo.self)
               .sink(receiveCompletion: { completion in
                   print("Subscription has been completed: \(completion)")
               }, receiveValue: { mutationEvent in
                   print("Subscription got this value: \(mutationEvent)")

                   do {
                     let todo = try mutationEvent.decodeModel(as: Todo.self)

                     switch mutationEvent.mutationType {
                     case "create":
                       print("Created: \(todo)")
                     case "update":
                       print("Updated: \(todo)")
                     case "delete":
                       print("Deleted: \(todo)")
                     default:
                       break
                     }

                   } catch {
                     print("Model could not be decoded: \(error)")
                   }
               })
    }
    
    
    func performOnAppear() {
//        ref update model func
        subscribeTodos()
        
//        delete item 
//        Amplify.DataStore.query(Todo.self,
//                                where: Todo.keys.name.eq("File quarterly taxes")) { result in
//            switch(result) {
//            case .success(let todos):
//                guard todos.count == 1, let toDeleteTodo = todos.first else {
//                    print("Did not find exactly one todo, bailing")
//                    return
//                }
//                Amplify.DataStore.delete(toDeleteTodo) { result in
//                    switch(result) {
//                    case .success:
//                        print("Deleted item: \(toDeleteTodo.name)")
//                    case .failure(let error):
//                        print("Could not update data in Datastore: \(error)")
//                    }
//                }
//            case .failure(let error):
//                print("Could not query DataStore: \(error)")
//            }
//       }
        
//        update item
//        Amplify.DataStore.query(Todo.self,
//                                where: Todo.keys.name.eq("Finish quarterly taxes")) { result in
//            switch(result) {
//            case .success(let todos):
//                guard todos.count == 1, var updatedTodo = todos.first else {
//                    print("Did not find exactly one todo, bailing")
//                    return
//                }
//                updatedTodo.name = "File quarterly taxes"
//                Amplify.DataStore.save(updatedTodo) { result in
//                    switch(result) {
//                    case .success(let savedTodo):
//                        print("Updated item: \(savedTodo.name)")
//                    case .failure(let error):
//                        print("Could not update data in Datastore: \(error)")
//                    }
//                }
//            case .failure(let error):
//                print("Could not query DataStore: \(error)")
//            }
//        }
        
//        data query
//        where: statment searches for all high priority items
//        Amplify.DataStore.query(Todo.self,
//                                where: Todo.keys.priority.eq(Priority.high)) { result in
//               switch(result) {
//               case .success(let todos):
//                   for todo in todos {
//                       print("==== Todo ====")
//                       print("Name: \(todo.name)")
//                       if let priority = todo.priority {
//                           print("Priority: \(priority)")
//                       }
//                       if let description = todo.description {
//                           print("Description: \(description)")
//                       }
//                   }
//               case .failure(let error):
//                   print("Could not query DataStore: \(error)")
//               }
//           }
//        create item in datastore
//        let item = Todo(name: "Finish quarterly taxes",
//                       priority: .high,
//                       description: "Taxes are due for the quarter next week")
        
//        Amplify.DataStore.save(item) { result in
//           switch(result) {
//           case .success(let savedItem):
//               print("Saved item: \(savedItem.name)")
//           case .failure(let error):
//               print("Could not save item to datastore: \(error)")
//           }
//        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





