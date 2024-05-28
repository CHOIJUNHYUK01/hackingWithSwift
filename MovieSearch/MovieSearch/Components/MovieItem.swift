//
//  MovieItem.swift
//  MovieSearch
//
//  Created by CHOIJUNHYUK on 5/28/24.
//

import SwiftUI

struct MovieItem: View {
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            if movie.posterURL != "N/A" {
                URLImage(url: movie.posterURL)
                    .frame(width: 100, height: 150)
            } else {
                ZStack {
                    Image(systemName: "nosign")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 100, height: 150)
            }
            VStack(alignment: .leading, spacing: 20) {
                Text(movie.title)
                    .font(.headline.bold())
                Text("개봉 연도 : \(movie.year)")
                    .font(.subheadline.bold())
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}
