//
//  TodoApp.swift
//  Todo
//
//  Created by Kennedy Cambra-Cho on 11/21/20.
//

import Amplify
import AmplifyPlugins
import SwiftUI

func configureAmplify() {
//   let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
    
    let models = AmplifyModels()
    let apiPlugin = AWSAPIPlugin(modelRegistration: models)
    let dataStorePlugin = AWSDataStorePlugin(modelRegistration: models)
    
//   do {
//       try Amplify.add(plugin: dataStorePlugin)
//       try Amplify.configure()
//       print("Initialized Amplify");
//   } catch {
//       // simplified error handling for the tutorial
//       print("Could not initialize Amplify: \(error)")
//   }
    
    do {
        try Amplify.add(plugin: apiPlugin)
        try Amplify.add(plugin: dataStorePlugin)
        try Amplify.configure()
        print("Initialized Amplify");
    } catch {
        print("Could not initialize Amplify: \(error)")
    }
}

@main
struct TodoApp: App {

//     add a default initializer and configure Amplify
    public init() {
        configureAmplify()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


