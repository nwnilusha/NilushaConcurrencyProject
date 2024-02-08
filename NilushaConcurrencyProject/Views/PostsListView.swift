//
//  PostsListView.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 3/2/24.
//

import Foundation
import SwiftUI

struct PostsListView: View {
    
    @ObservedObject var viewModel = PostsListViewModel(service: Service())
    var userId: Int?
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            }
        }
        .overlay(content: {
            if viewModel.isLoading {
                ProgressView()
            }
        })
        .alert("Application Error", isPresented: $viewModel.showAlert, actions: {
            Button("OK"){}
        },message: {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            }
        })
        .navigationTitle("Posts")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            viewModel.userId = userId
            await viewModel.fetchPosts()
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostsListView(userId: 1)
        }
    }
}
