//
//  UsersList.swift
//  Concurrency
//
//  Created by J S on 10/23/24.
//

import SwiftUI

struct UsersListView: View {
    @StateObject var viewModel = UsersListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.title)
                        Text(user.email)
                    }
                }
            }
            .navigationTitle("Users")
            .listStyle(.plain)
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    UsersListView()
}
