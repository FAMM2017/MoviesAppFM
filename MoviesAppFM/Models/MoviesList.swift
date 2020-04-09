//
//  MoviesList.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 08-04-20.
//  Copyright © 2020 mac. All rights reserved.
//

import ObjectMapper

class MoviesList: Mappable {
    var page, totalResults, totalPages: Int?
    var results: [Movie]?
    
    required init?(map: Map){

    }
    
    func mapping(map: Map) {
        page <- map["pages"]
        totalResults <- map["totalResults"]
        totalPages <- map["totalPages"]
        results <- map["results"]
    }
    
}
