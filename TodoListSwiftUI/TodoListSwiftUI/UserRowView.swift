//
//  UserRowView.swift
//  TodoListSwiftUI
//
//  Created by cuongtran on 10/30/24.
//

import SwiftUI
struct UserRowView: View {
    let user: User
    var body: some View {
        HStack {
            AsyncImage(
                url: user.avatarUrl(),
                content: { $0.resizable() },
                placeholder: { }
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, content: {
                Text("Name: \(user.login)")
                Text("Search URL: \(user.url)")
            })
        }
    }
}
