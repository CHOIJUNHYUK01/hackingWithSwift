//
//  DetailView.swift
//  MovieSearch
//
//  Created by CHOIJUNHYUK on 5/28/24.
//

import SwiftUI

struct DetailView: View, Hashable {
    @Binding var path: NavigationPath
    @StateObject private var network = NetworkManager.shared
    
    var genres: [String] {
        return network.movieDetail?.genre.components(separatedBy: ", ") ?? ["Genre1", "Genre2", "Genre3"]
    }
    
    var actors: [String] {
        return network.movieDetail?.actors.components(separatedBy: ", ") ?? ["Actor1", "Actor2", "Actor3"]
    }
    
    var body: some View {
        if network.movieDetail != nil {
            ScrollView {
                Text(network.movieDetail!.title)
                    .font(.title.bold())
                
                VStack(spacing: 20) {
                    if network.movieDetail!.poster != "N/A" {
                        URLImage(url: network.movieDetail!.poster)
                    } else {
                        ZStack {
                            Image(systemName: "nosign")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(height: 359)
                    }
                    
                    
                    VStack(alignment: .center) {
                        HStack {
                            Text(network.movieDetail!.released)
                                .font(.headline)
                            Divider()
                            Text(network.movieDetail!.runtime)
                                .font(.headline)
                        }
                        
                        HStack {
                            ForEach(genres, id: \.self) {
                                Text($0)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                        Spacer(minLength: 10)
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text(network.movieDetail?.rating ?? "")
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    VStack(alignment: .center) {
                        Text("Summary")
                            .font(.title2.bold())
                        
                        Spacer()
                        
                        Text(network.movieDetail!.plot)
                            .padding()
                    }
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    Text("Director / Actors")
                        .font(.title2.bold())
                    
                    ScrollView(.horizontal) {
                        VStack(alignment: .leading) {
                            
                            
                            HStack {
                                Spacer()
                                    .padding(.horizontal, 2)
                                
                                VStack {
                                    Text(network.movieDetail!.director)
                                        .padding()
                                        .font(.callout.bold())
                                        .background(.blue)
                                        .foregroundStyle(.white)
                                        .clipShape(.rect(cornerRadius: 20))
                                    
                                    Text("Director")
                                        .font(.footnote)
                                }
                                
                                ForEach(actors, id: \.self) { actor in
                                    VStack {
                                        Text(actor)
                                            .padding()
                                            .font(.callout.bold())
                                            .background(.red)
                                            .foregroundStyle(.white)
                                            .clipShape(.rect(cornerRadius: 20))
                                        
                                        Text("Actor")
                                            .font(.footnote)
                                    }
                                }
                                
                                Spacer()
                                    .padding(.horizontal, 2)
                            }
                        }
                    }
                }
                
            }
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .onDisappear {
                network.movieDetail = nil
            }
        } else {
            ProgressView()
        }
    }
    
    static func == (lhs: DetailView, rhs: DetailView) -> Bool {
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine("DetailView")
    }
}

#Preview {
    DetailView(path: .constant(NavigationPath()))
}
