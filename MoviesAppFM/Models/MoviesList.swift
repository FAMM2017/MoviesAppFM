//
//  MoviesList.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 08-04-20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct MoviesList: Codable {
    let page, totalResults, totalPages: Int
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
