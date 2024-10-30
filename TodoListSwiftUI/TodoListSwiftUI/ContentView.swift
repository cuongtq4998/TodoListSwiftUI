//
//  ContentView.swift
//  TodoListSwiftUI
//
//  Created by cuongtran on 10/30/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fetch = FetchUsers()
    
    var body: some View {
        VStack {
            Text("Total result: \(fetch.items.count)")
            
            if fetch.items.isEmpty {
                ProgressView().onAppear {
                    fetch.loadData()
                }
            } else {
                List(fetch.items, id: \.id) { user in
                    Link(destination: user.pageUrl()) {
                        UserRowView(user: user)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
