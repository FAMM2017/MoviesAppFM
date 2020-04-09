//
//  MoviesInteractor.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 08-04-20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import Alamofire

class MoviesInteractor{
    
    func getMovies(pageNumber:(Int), callBack:@escaping (MoviesCallback) -> Void){
        let headers: HTTPHeaders = [
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NjFiNmY0YzA2ZGQ5ZGY1ZTZkNDJjNThiYjZhYzBjOSIsInN1YiI6IjVlOGRkZmJiZDIzNmU2MDAxMmU5MjUxYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.t_kA5u1A7K9LeGXvX9Gd-axLEJEQ6_zkoC0UEuuQW_s",
                "Content-Type": "application/json"
            ]
            AF.request("https://api.themoviedb.org/3/movie/popular?page=\(pageNumber)",headers: headers)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        do
                        {
                            guard let data = response.data else { return }
                            let decoder = JSONDecoder()
                            let result = try decoder.decode(MoviesList.self, from: data)
                            callBack(MoviesCallback(onSuccess: result.results,onError: false))
                            print("Response Successful")
                        }
                        catch let error {
                            print(error.localizedDescription)
                            callBack(MoviesCallback(onSuccess: [],onError: true))
                        }
                    case let .failure(error):
                        print(error)
                        callBack(MoviesCallback(onSuccess: [],onError: true))
                    }
        }
    }
}
