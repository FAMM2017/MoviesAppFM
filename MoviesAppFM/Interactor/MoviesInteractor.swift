//
//  MoviesInteractor.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 08-04-20.
//  Copyright © 2020 mac. All rights reserved.
//

import AlamofireObjectMapper
import Alamofire

class MoviesInteractor{
    let headers: HTTPHeaders = [
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NjFiNmY0YzA2ZGQ5ZGY1ZTZkNDJjNThiYjZhYzBjOSIsInN1YiI6IjVlOGRkZmJiZDIzNmU2MDAxMmU5MjUxYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.t_kA5u1A7K9LeGXvX9Gd-axLEJEQ6_zkoC0UEuuQW_s",
        "Content-Type": "application/json"
    ]
    func getMovies(pageNumber:(Int), callBack:@escaping (MoviesCallback) -> Void){
        
            Alamofire.request("https://api.themoviedb.org/3/movie/popular?page=\(pageNumber)",
                method: HTTPMethod.get,parameters: nil,
                encoding: JSONEncoding.default, headers: headers)
                .validate()
                .responseObject{(response:DataResponse<MoviesList>) in
                    switch response.result {
                    case .success:
                        callBack(MoviesCallback(onSuccess: response.value?.results ?? [],onError: false))
                        print("Response Successful")
                    case let .failure(error):
                        print(error)
                        callBack(MoviesCallback(onSuccess: [],onError: true))
                    }
        }
    }
}
