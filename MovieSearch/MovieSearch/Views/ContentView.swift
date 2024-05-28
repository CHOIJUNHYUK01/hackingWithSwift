//
//  ContentView.swift
//  MovieSearch
//
//  Created by CHOIJUNHYUK on 5/28/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var network = NetworkManager.shared
    
    @State private var path = NavigationPath()
    @State private var searchTerm = ""
    
    @FocusState private var isSearchFieldFocused: Bool
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(network.movieList, id: \.self) { eachMovie in
                    Button(action: {
                        network.fetchMovieDetail(id: eachMovie.movieId)
                        isSearchFieldFocused = false
                        path.append(DetailView(path: $path))
                    }, label: {
                        MovieItem(movie: eachMovie)
                            .onAppear {
                                // Check if the current item is the last one
                                if eachMovie == network.movieList.last {
                                    network.moviePage += 1
                                    network.fetchMovieList(s: "star", page: network.moviePage)
                                }
                            }
                    })
                }
            }
            .listStyle(.plain)
            .navigationTitle("Movies")
            .navigationDestination(for: DetailView.self) { view in
                view
            }
        }
        .onAppear {
            network.fetchMovieList(s: "star", page: 1)
        }
        .alert(network.alertTitle, isPresented: $network.showAlert) {
            Button("OK") {
                network.showAlert = false
                network.alertTitle = ""
                network.alertMessage = ""
            }
        } message: {
            Text(network.alertMessage)
        }
        .searchable(text: $searchTerm, prompt: "Search Movies")
        .focused($isSearchFieldFocused)
        .onChange(of: searchTerm) { _, newValue in
            if newValue.count > 2 {
                network.movieList = [Movie]()
                network.fetchMovieList(s: newValue, page: 1)
            } else {
                network.movieList = [Movie]()
                network.fetchMovieList(s: "star", page: 1)
            }
        }
    }
}


#Preview {
    ContentView()
}
