//
//  NetworkManager.swift
//  MovieSearch
//
//  Created by CHOIJUNHYUK on 5/28/24.
//

import Foundation

class NetworkManager: ObservableObject {
    static let shared = NetworkManager()
    private init() { }
    
    private let API_KEY = Bundle.main.object(forInfoDictionaryKey: "API_KEY")!
    
    @Published var movieList = [Movie]()
    @Published var movieDetail: MovieDetail?
    @Published var moviePage = 1
    @Published var showAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    
    func fetchMovieList(s: String, page: Int) {
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=\(API_KEY)&s=\(s)&page=\(page)&type=movie") else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            if let data = data {
                if let dataList = self.parseJSONwithMovieList(data) {
                    DispatchQueue.main.async {
                        if self.movieList.count != 0 {
                            self.movieList.append(contentsOf: dataList.list)
                        } else {
                            self.movieList = dataList.list
                        }
                    }
                }
            }
        }
        
        task.resume()
    }
    
    func fetchMovieDetail(id: String) {
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=963d67cd&i=\(id)&plot=full") else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            if let data = data {
                if let detailData = self.parseJSONwithMovieDetail(data) {
                    DispatchQueue.main.async {
                        self.movieDetail = detailData
                    }
                }
            }
        }
        
        task.resume()
    }
    
    func parseJSONwithMovieList(_ movieListData: Data) -> Movies? {
        do {
            let movieList = try JSONDecoder().decode(Movies.self, from: movieListData)
            return movieList
        } catch {
            DispatchQueue.main.async {
                self.showAlert = true
                self.alertTitle = "Sorry, We cannot found it"
                self.alertMessage = "Try another term please"
            }
            return nil
        }
    }
    
    func parseJSONwithMovieDetail(_ movieDetail: Data) -> MovieDetail? {
        do {
            let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: movieDetail)
            return movieDetail
        } catch {
            DispatchQueue.main.async {
                self.showAlert = true
                self.alertTitle = "Sorry, We do not know this movie"
                self.alertMessage = ""
            }
            return nil
        }
    }
}
