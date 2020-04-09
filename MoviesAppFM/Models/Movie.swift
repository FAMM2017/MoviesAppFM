//
//  Movie.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 08-04-20.
//  Copyright © 2020 mac. All rights reserved.
//

import ObjectMapper

class Movie: Mappable {
    
    var popularity: Double?
    var voteCount: Int?
    var video: Bool?
    var posterPath: String?
    var id: Int?
    var adult: Bool?
    var backdropPath, originalLanguage, originalTitle: String?
    var genreIDS: [Int]?
    var title: String?
    var voteAverage: Double?
    var overview, releaseDate: String?
    
    required init?(map: Map){

    }
    
    func mapping(map: Map) {
        popularity <- map["popularity"]
        voteCount <- map["vote_count"]
        video <- map["video"]
        posterPath <- map["poster_path"]
        id <- map["id"]
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        genreIDS <- map["genre_ids"]
        title <- map["title"]
        voteAverage <- map["vote_average"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
    }
    
}
