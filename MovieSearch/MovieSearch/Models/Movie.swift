//
//  Movie.swift
//  MovieSearch
//
//  Created by CHOIJUNHYUK on 5/28/24.
//

import Foundation

// MARK: - Movies
struct Movies: Codable {
    let list: [Movie]

    enum CodingKeys: String, CodingKey {
        case list = "Search"
    }
}

// MARK: - Movie
struct Movie: Codable, Hashable {
    let title, year, movieId: String
    let posterURL: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case movieId = "imdbID"
        case posterURL = "Poster"
    }
}

// MARK: - MovieDetail
struct MovieDetail: Codable {
    let title, year, released: String
    let runtime, genre, director: String
    let actors, plot: String
    let poster: String
    let rating: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case rating = "imdbRating"
    }
}
